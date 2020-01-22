<template>
  <div class="login_container">
    <div class="login_box">
      <div class="avator_box">
        <!-- 头像区 -->
        <img src="~assets/logo.png" alt />
      </div>
      <!-- 表单区 -->
      <el-form
        ref="loginForm"
        :model="loginForm"
        :rules="rules"
        label-width="0px"
        class="login_form"
      >
        <el-form-item prop="username">
          <el-input placeholder="用户名" v-model="loginForm.username">
            <img class="icon" slot="prefix" src="~assets/img/login_user.svg" />
          </el-input>
        </el-form-item>

        <el-form-item prop="password">
          <el-input placeholder="密码" v-model="loginForm.password" type="password">
            <img class="icon" slot="prefix" src="~assets/img/login_pwd.svg" />
          </el-input>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" class="btns" @click="login">登 录</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
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
        if (valid) {
          let formData = new FormData();
          formData.append("username", this.loginForm.username);
          formData.append("password", this.loginForm.password);
          this.$http
            .post("/login", formData)
            .then(res => {
              if (res.data.success === true) {
                let data = res.data.data;
                window.sessionStorage.setItem("token", data.token);
                window.sessionStorage.setItem("username", data.username);
                window.sessionStorage.setItem("id", data.id);
                this.$store.commit("login", data);
                this.$message.success("欢迎回来，" + data.username + "!");
                setTimeout(() => {
                  this.$router.replace("/index");
                }, 1000);
              } else {
                this.$message.error(res.data.message + "，登陆失败！");
              }
            })
            .catch(err => {
              this.$message.error("网络异常，登陆失败！");
            });
        }
      });
    }
  }
};
</script>

<style lang="less" scoped>
.login_container {
  background-color: #ebeff1;
  // min-height: 1080px;
  height: 100%;
}

.login_box {
  width: 450px;
  height: 300px;
  background-color: #fff;
  border-radius: 3px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}

.avator_box {
  height: 130px;
  width: 130px;
  border: 1px solid #eee;
  border-radius: 50%;
  padding: 10px;
  box-shadow: 0 0 10px #ddd;
  position: absolute;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #fff;
  img {
    height: 100%;
    width: 100%;
    border-radius: 50%;
    background-color: #eee;
  }
}

.login_form {
  position: absolute;
  bottom: 0;
  width: 100%;
  padding: 20px;
  box-sizing: border-box;
}
.btns {
  display: flex;
  margin: 0 auto;
}
.icon {
  width: 25px;
  height: 40px;
  float: left;
}
</style>