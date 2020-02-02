<template>
  <el-main>
    <h2 style="text-align: center">{{problem.title}}</h2>
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="题目信息" name="detail">
        <div class="pb-label">题目描述</div>
        <el-input
          type="textarea"
          readonly
          resize="none"
          autosize
          v-model="problem.description"
          class="pb-text"
        ></el-input>
        <div class="pb-label">输入描述</div>
        <el-input
          type="textarea"
          readonly
          resize="none"
          autosize
          v-model="problem.input"
          class="pb-text"
        ></el-input>
        <div class="pb-label">输出描述</div>
        <el-input
          type="textarea"
          readonly
          resize="none"
          autosize
          v-model="problem.output"
          class="pb-text"
        ></el-input>
        <div v-for="(item, index) in problem.samples" :key="index">
          <div class="pb-label">
            示例输入{{index+1}}
            <el-button
              round
              size="small"
              @click="sampleCopy('input', index, $event)"
              style="float: right"
            >复制</el-button>
          </div>
          <el-input
            type="textarea"
            readonly
            resize="none"
            autosize
            v-model="item.input"
            class="pb-text"
          ></el-input>
          <div class="pb-label">
            示例输出{{index+1}}
            <el-button
              round
              size="small"
              @click="sampleCopy('output', index, $event)"
              style="float: right"
            >复制</el-button>
          </div>
          <el-input
            type="textarea"
            readonly
            resize="none"
            autosize
            v-model="item.output"
            class="pb-text"
          ></el-input>
        </div>
        <div class="pb-label">作者</div>
        <el-input
          type="textarea"
          readonly
          resize="none"
          autosize
          v-model="problem.author"
          class="pb-text"
        ></el-input>
      </el-tab-pane>
      <el-tab-pane label="提交代码" name="submit">
        <el-form :model="submitForm" ref="submitForm" :rules="rules">
          <el-form-item prop="language" label="提交语言">
            <el-select v-model="submitForm.language">
              <el-option
                v-for="item in submitForm.validLanguage"
                :label="item"
                :value="item"
                :key="item"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item prop="code" label="源代码">
            <el-input
              type="textarea"
              :autosize="{ minRows: 21, maxRows: 25}"
              :rows="2"
              v-model="submitForm.code"
            ></el-input>
          </el-form-item>
          <el-form-item style="text-align: right">
            <el-button plain @click="submit">提交</el-button>
            <el-button plain @click="resetForm('submitForm')">重置</el-button>
          </el-form-item>
        </el-form>
      </el-tab-pane>
      <el-tab-pane label="提交状态" name="status"></el-tab-pane>
    </el-tabs>
  </el-main>
</template>

<script>
import ClipBoard from "clipboard";
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
      activeName: "detail",
      problem: {},
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
    //提供复制样例功能
    sampleCopy(ope, index, e) {
      let text = "";
      if ("input" === ope) text = this.problem.samples[index].input;
      else text = this.problem.samples[index].output;
      const clipboard = new ClipBoard(e.target, { text: () => text });
      clipboard.on("success", e => {
        this.$message({ type: "success", message: "复制成功" });
        clipboard.destroy(); // 释放内存
      });
      clipboard.on("error", e => {
        this.$message({ type: "waning", message: "该浏览器不支持自动复制" });
        clipboard.destroy(); // 释放内存
      });
      clipboard.onClick(e); // 事件绑定
    },
    handleClick(tab, event) {},
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
              }
            })
            .catch(err => {
              this.$message.error("提交失败");
            });
        }
      });
    }
  },
  created() {
    // console.log('problem' + this.$route.params.pid+'created')
    this.$http
      .get("/problem/" + this.$route.params.pid)
      .then(({ data }) => {
        // console.log(res)
        if (data.success === true) {
          this.problem = data.data;
        }
      })
      .catch(err => {
        console.log(err);
      });
  }
};
</script>

<style scoped>
/* .el-main {
  min-height: 850px;
} */

.pb-text {
  font-size: 24px;
}

.pb-label {
  margin: 15px 10px;
  font-size: 24px;
}
</style>