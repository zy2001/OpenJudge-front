<template>
  <el-main>
    <h2 style="text-align: center">{{$store.state.problem.title}}</h2>
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="题目信息" name="detail"></el-tab-pane>
      <el-tab-pane label="提交代码" name="submit"></el-tab-pane>
      <el-tab-pane label="提交状态" name="status"></el-tab-pane>
    </el-tabs>
    <router-view></router-view>
  </el-main>
</template>

<script>
import ClipBoard from "clipboard";
export default {
  data() {
    return {
      activeName: "status",
    };
  },
  methods: {
    handleClick(tab, event) {
      this.$router.push('/problem/'+this.$route.params.pid+'/'+tab.name)
    },
    getTitle() {
      return this.$store.state.problem.title
    }
  },
};
</script>

<style scoped>


</style>