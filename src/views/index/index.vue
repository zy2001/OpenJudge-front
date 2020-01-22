<template>
  <el-main>
    
  </el-main>
</template>

<script>
// import ProblemTable from 'views/problemset/problemset'
export default {
  components: {
    // ProblemTable
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