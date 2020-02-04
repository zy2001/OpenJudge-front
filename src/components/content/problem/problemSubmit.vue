<template>
  <el-form :model="submitForm" ref="submitForm" :rules="rules" style="margin-top: 20px">
    <el-form-item prop="language" label="提交语言">
      <el-select v-model="submitForm.language">
        <el-option v-for="item in submitForm.validLanguage" :label="item" :value="item" :key="item"></el-option>
      </el-select>
    </el-form-item>
    <el-form-item prop="code" label="源代码">
      <el-input type="textarea" :autosize="{ minRows: 21, maxRows: 25}" :rows="2" v-model="submitForm.code"></el-input>
    </el-form-item>
    <el-form-item style="text-align: right">
      <el-button plain @click="submit">提交</el-button>
      <el-button plain @click="resetForm('submitForm')">重置</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
export default {
  data() {
    //检测选择的语言
    var checkLanguage = (rule, value, callback) => {
      if (this.submitForm.validLanguage.indexOf(value) != -1) {
        return callback();
      } else {
        return callback(new Error("请选择正确的提交语言"));
      }
    };
    //检测代码长度
    var checkCode = (rule, value, callback) => {
      console.log(value.length);
      if (value.length > 50 && value.length < 65536) {
        return callback();
      } else {
        return callback(new Error("代码长度应大于50byte并且小于65536byte"));
      }
    };
    return {
      submitForm: {
        validLanguage: ["C", "C++", "JAVA"],
        language: "C++",
        code: ""
      },
      rules: {
        language: [{ validator: checkLanguage, trigger: "blur" }],
        code: [{ validator: checkCode, trigger: "blur" }]
      }
    };
  },
  methods: {
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    submit() {
      this.$refs.submitForm.validate(valid => {
        if (valid) {
          let formData = new FormData();
          formData.append("pid", this.$route.params.pid);
          formData.append("uid", this.$store.state.user.id);
          formData.append("language", this.submitForm.language);
          formData.append("code", this.submitForm.code);
          this.$http
            .post("/submit", formData)
            .then(({ data }) => {
              if (data.success === true) {
                this.$message.success(data.message);
                this.activeName = "status";
                this.$router.push(
                  "/problem/" + this.$route.params.pid + "/status"
                );
              } else {
                this.$message.err(data.message + ",提交失败");
              }
            })
            .catch(err => {
              this.$message.error("网络异常,提交失败");
            });
        }
      });
    }
  }
};
</script>

<style scoped>
</style>