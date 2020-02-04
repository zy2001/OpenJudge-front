<template>
  <el-main>
  </el-main>
</template>

<script>
// import ProblemTable from 'views/problemset/problemset'
// import Login from "components/content/nav_bar/login";
export default {
  components: {
    // ProblemTable
    // Login
  },
  data() {
    return {
      activeIndex: "1",
      activeIndex2: "1"
    };
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    }
  }
};
</script>

<style scoped>
</style>