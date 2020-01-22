<template>
  <el-header class="header">
    <el-menu router :default-active="$route.path" class="nav_bar" mode="horizontal">
      <el-menu-item index="/index">首页</el-menu-item>
      <el-menu-item index="/problemset">题库</el-menu-item>
      <el-menu-item index="3">比赛</el-menu-item>
      <el-menu-item index="4">提交状态</el-menu-item>
      <el-menu-item v-if="$store.state.user.id === -1" index="/login" style="float: right">登录</el-menu-item>
      <el-menu-item v-if="$store.state.user.id === -1" index="6" style="float: right">注册</el-menu-item>
      <el-submenu v-if="$store.state.user.id !== -1" index="7" style="width: 90px; float: right">
        <template slot="title">{{$store.state.user.username}}</template>
        <el-menu-item index="7-1">选项1</el-menu-item>
        <el-menu-item index="7-2">选项2</el-menu-item>
        <el-menu-item @click="logout">退出</el-menu-item>
      </el-submenu>
    </el-menu>
  </el-header>
</template>

<script>
export default {
  data() {
    return {};
  },
  methods: {
    logout() {
      window.sessionStorage.clear();
      let obj = {
        id: -1,
        token: "",
        username: ""
      };
      this.$store.commit("login", obj);
    }
  },
  computed: {},
  created() {
    console.log("created");
    let token = window.sessionStorage.getItem("token");
    let username = window.sessionStorage.getItem("username");
    let id = window.sessionStorage.getItem("id");
    if (token != null && id != null && username != null) {
      let obj = {
        id,
        token,
        username
      };
      this.$store.commit("login", obj);
    } else {
      let obj = {
        id: -1,
        token: "",
        username: ""
      };
      this.$store.commit("login", obj);
    }
  }
};
</script>

<style scoped>
.header {
  position: fixed;
  z-index: 101;
}

.nav_bar {
  width: 1140px;
  margin: 0 auto;
}

.nav_box {
  float: right;
  display: flex;
}

.right {
  float: right;
}
</style>