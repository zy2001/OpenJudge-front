<template>
  <div id="app">
    <el-container>
      <nav-bar v-show="show"></nav-bar>
      <keep-alive>
      <router-view style="margin-top: 60px"></router-view>
      </keep-alive>
      <el-footer v-show="show">

      </el-footer>
    </el-container>
  </div>
</template>

<script>
import NavBar from "components/content/nav_bar/navbar";
export default {
  name: "app",
  components: {
    NavBar
  },
  computed: {
    show() {
      return this.$route.path.indexOf("login") === -1;
    }
  }
};
</script>

<style>
.el-footer {
  background-color: #ebeff1;
  color: #333;
  line-height: 60px;
}

.el-container {
  min-width: 1180px;
  width: 1180px;
  margin: 0 auto;
}
</style>
