<template>
  <div class="header">
    <el-menu router :default-active="getActive" class="nav_bar" mode="horizontal">
      <el-menu-item index="/index">首页</el-menu-item>
      <el-menu-item index="/problemset">题库</el-menu-item>
      <!-- <el-menu-item index="/3">比赛</el-menu-item> -->
      <el-menu-item index="/status">提交状态</el-menu-item>
      <!-- <el-menu-item v-if="$store.state.user.id === -1" index="/login" style="float: right">登录</el-menu-item> -->
      <el-menu-item
        v-if="$store.state.user.id === -1"
        @click="showLoginDialog"
        style="float: right"
      >登录</el-menu-item>
      <el-menu-item
        v-if="$store.state.user.id === -1"
        @click="showRegisterDialog"
        style="float: right"
      >注册</el-menu-item>
      <el-submenu v-if="$store.state.user.id !== -1" index="/7" style="width: 90px; float: right">
        <template slot="title">{{$store.state.user.username}}</template>
        <el-menu-item @click="logout">退出</el-menu-item>
      </el-submenu>
    </el-menu>
    <!-- </el-header> -->
    
  </div>
</template>

<script>

export default {
  components: {
   
  },
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
    },
    showLoginDialog() {
      this.$store.commit("showLoginDialog", true);
    },
    showRegisterDialog() {
      this.$store.commit("showRegisterDialog", true);
    }
  },
  computed: {
    getActive() {
      let ret = "";
      if (-1 != this.$route.path.indexOf("problem")) ret = "/problemset";
      else ret = this.$route.path;
      // console.log(ret)
      return ret;
    }
  },
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