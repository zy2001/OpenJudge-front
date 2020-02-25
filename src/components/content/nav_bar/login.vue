<template>
  <el-dialog title="用户登录" :visible.sync="$store.state.loginVisible" width="490px">
    <!-- 表单区 -->
    <el-form ref="loginForm" :model="loginForm" :rules="rules" class="login_form">
      <el-form-item prop="username">
        <el-input placeholder="用户名" v-model="loginForm.username">
          <img class="icon" slot="prefix" src="~assets/img/user.svg" />
        </el-input>
      </el-form-item>

      <el-form-item prop="password">
        <el-input placeholder="密码" v-model="loginForm.password" type="password">
          <img class="icon" slot="prefix" src="~assets/img/lock.svg" />
        </el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" class="btns" @click="login">登 录</el-button>
      </el-form-item>
    </el-form>
  </el-dialog>
</template>

<script>
import { httpLogin } from "network/post";
export default {
  data() {
    return {
      dialogFormVisible: false,
      loginForm: {
        username: "",
        password: ""
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          { min: 6, max: 15, message: "长度在 6 到 15 个字符", trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { min: 6, max: 15, message: "长度在 6 到 15 个字符", trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    login() {
      this.$refs.loginForm.validate(valid => {
        if (!valid) return;
        //填写账号密码
        httpLogin(this.loginForm.username, this.loginForm.password)
          .then(({ data }) => {
            console.log(data);
            if (data.success === true) {
              //登陆成功 存用户信息
              let user = data.data;
              window.sessionStorage.setItem("token", user.token);
              window.sessionStorage.setItem("username", user.username);
              window.sessionStorage.setItem("id", user.id);
              this.$store.commit("login", user);
              this.$message.success("欢迎回来，" + user.username + "!");
              //关闭登录窗口
              this.$store.commit("showLoginDialog", false);
            } else {
              this.$message.error(data.message + "，登陆失败！");
            }
          })
          .catch(err => {
            console.log(err);
            this.$message.error("网络异常，登陆失败！");
          });
      });
    }
  }
};
</script>

<style scoped>
.login_form {
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