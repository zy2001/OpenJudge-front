<template>
  <div style="margin-top: 20px">
    <el-table :data="submitStatus.itemList" stripe>
      <el-table-column prop="rid" label="运行编号" width="120" align="center"></el-table-column>
      <el-table-column prop="status" label="运行结果" width="240" align="center"></el-table-column>
      <el-table-column prop="runTime" label="运行时间" width="130" align="center"></el-table-column>
      <el-table-column prop="runMemory" label="运行内存" width="130" align="center"></el-table-column>
      <el-table-column prop="language" label="提交语言" width="120" align="center"></el-table-column>
      <el-table-column prop="gmtCreated" label="提交时间" width="240" align="center"></el-table-column>
      <el-table-column prop="username" label="用户名称" width="160" align="center"></el-table-column>
    </el-table>
    <el-pagination
      @current-change="currentChange"
      :current-page="1"
      :page-size="submitStatus.size"
      layout="prev, pager, next"
      :total="submitStatus.total"
      class="pb_pagn"
    ></el-pagination>
  </div>
</template>

<script>
export default {
  data() {
    return {
      submitStatus: {
        total: 0,
        size: 20,
        itemList: []
      }
    };
  },
  methods: {
    //status翻页
    currentChange(page) {
      console.log(page);
    }
  },
  created() {
    let formData = new FormData();
    formData.append("pid", this.$route.params.pid);
    formData.append("page", 1);
    formData.append("size", 20);
    this.$http
      .post("/submitStatus", formData)
      .then(({ data }) => {
        console.log(data);
        if (data.success === true) {
          this.submitStatus = data.data;
          //   this.$store.commit('setTitle', this.problem.title)
        }
      })
      .catch(err => {
        console.log(err);
      });
  }
};
</script>

<style scoped>
.pb_pagn {
  float: right;
  padding: 20px;
}
</style>