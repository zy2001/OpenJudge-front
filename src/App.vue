<template>
  <div id="app">
    <el-container>
      <el-header v-show="show">
        <nav-bar></nav-bar>
      </el-header>
      <keep-alive>
        <router-view class="main"></router-view>
      </keep-alive>
      <el-footer v-show="show">
        <my-footer></my-footer>
      </el-footer>
    </el-container>
    <login></login>
    <register></register>
  </div>
</template>

<script>
import NavBar from "components/content/nav_bar/navbar";
import MyFooter from "components/content/footer/footer";
import Login from "components/content/nav_bar/login";
import Register from "components/content/nav_bar/register";
export default {
  name: "app",
  components: {
    NavBar,
    MyFooter,
    Login,
    Register
  },
  computed: {
    show() {
      return this.$route.path.indexOf("login") === -1;
    }
  }
};
</script>

<style>
.el-container {
  min-width: 1180px;
  width: 1180px;
  margin: 0 auto;
}

.main {
  min-height: 849px;
}

.el-footer {
  line-height: 30px;
  background-color: #ebeff1;
  color: #333;
  text-align: center;
}

.Message-Zindex {
    z-index:3000 !important;
  }
</style>
