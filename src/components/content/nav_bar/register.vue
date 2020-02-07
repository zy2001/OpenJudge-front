<template>
  <el-dialog
    title="用户注册"
    :visible.sync="$store.state.registerVisible"
    width="490px"
    @closed="resetRegisterForm"
  >
    <!-- 表单区 -->
    <el-form ref="registerForm" :model="registerForm" :rules="rules" class="register_form">
      <el-form-item prop="username">
        <el-input placeholder="用户名" v-model="registerForm.username" auto-complete="new-password">
          <img class="icon" slot="prefix" src="~assets/img/user.svg" />
        </el-input>
      </el-form-item>

      <el-form-item prop="password">
        <el-input
          placeholder="密码"
          v-model="registerForm.password"
          type="password"
          auto-complete="new-password"
        >
          <img class="icon" slot="prefix" src="~assets/img/lock.svg" />
        </el-input>
      </el-form-item>

      <el-form-item prop="repeatPassword">
        <el-input
          placeholder="重复密码"
          v-model="registerForm.repeatPassword"
          type="password"
          auto-complete="new-password"
        >
          <img class="icon" slot="prefix" src="~assets/img/lock.svg" />
        </el-input>
      </el-form-item>

      <!-- <el-form-item prop="email">
        <el-input
          placeholder="邮箱"
          v-model="registerForm.email"
          type="text"
          auto-complete="new-password"
        >
          <img class="icon" slot="prefix" src="~assets/img/mail.svg" />
        </el-input>
      </el-form-item>-->

      <el-form-item>
        <el-button type="primary" class="btns" @click="register">注 册</el-button>
      </el-form-item>
    </el-form>
  </el-dialog>
</template>

<script>
export default {
  data() {
    //检测用户名是否含有非法字符
    var checkUsernameLegal = (rule, value, callback) => {
      let reg = /^[0-9a-zA-z]*$/;
      if (reg.test(value)) return callback();
      return callback(new Error("用户名只能包含大小写字母或数字"));
    };
    //检测用户名是否可用
    var checkUsernameUsed = (rule, value, callback) => {
      let formData = new FormData();
      formData.append("username", value);
      this.$http
        .post("/checkUsernameUsed", formData)
        .then(({ data }) => {
          if (data.success === true) {
            callback();
          } else {
            callback(new Error(data.message));
          }
        })
        .catch(err => {
          callback(new Error("网络异常"));
        });
    };
    //检测重复输入的密码和原密码是否相同
    var checkRepeatPassword = (rule, value, callback) => {
      if (value === "") return callback(new Error("请输入重复密码"));
      if (value === this.registerForm.password) {
        return callback();
      }
      return callback(new Error("密码不匹配"));
    };
    return {
      registerForm: {
        username: "",
        password: "",
        repeatPassword: "",
        email: ""
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          {
            min: 6,
            max: 15,
            message: "长度在 6 到 15 个字符",
            trigger: "blur"
          },
          { validator: checkUsernameLegal, trigger: "blur" },
          { validator: checkUsernameUsed, trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { min: 6, max: 15, message: "长度在 6 到 15 个字符", trigger: "blur" }
        ],
        repeatPassword: [{ validator: checkRepeatPassword, trigger: "blur" }]
        // email: [
        //   { required: true, message: "请输入邮箱地址", trigger: "blur" },
        //   {
        //     type: "email",
        //     message: "请输入正确的邮箱地址",
        //     trigger: ["blur", "change"]
        //   }
        // ]
      }
    };
  },
  methods: {
    register() {
      this.$refs.registerForm.validate(valid => {
        if (valid) {
          //填写账号密码
          let formData = new FormData();
          formData.append("username", this.registerForm.username);
          formData.append("password", this.registerForm.password);
          // formData.append("email", this.registerForm.email);
          //发送注册请求
          this.$http
            .post("/register", formData)
            .then(({ data }) => {
              // console.log(data);
              //注册成功
              if (data.success === true) {
                this.$message.success(
                  this.registerForm.username + "，注册成功!"
                );
                //关闭注册窗口
                this.$store.commit("showRegisterDialog", false);
              } else {
                this.$message.error(data.message + "，注册失败!");
              }
            })
            .catch(err => {
              // console.log(err);
              this.$message.error("网络异常，注册失败！");
            });
        }
      });
    },
    //关闭注册窗口时重置注册表单
    resetRegisterForm() {
      this.$refs.registerForm.resetFields();
    }
  }
};
</script>

<style scoped>
.register_form {
  bottom: 0;
  width: 100%;
  padding: 10px 20px 0 20px;
  box-sizing: border-box;
}

.icon {
  width: 25px;
  height: 40px;
  float: left;
}

.btns {
  display: flex;
  margin: 0 auto;
}
</style>