<template>
  <el-main>
    <el-table :data="problemSet.itemList" stripe>
      <el-table-column prop="pid" label="#" width="80"></el-table-column>
      <el-table-column label="题目" width="520">
        <template slot-scope="scope">
          <a :href="'/problem/' + scope.row.pid">{{scope.row.title}}</a>
        </template>
      </el-table-column>
      <el-table-column prop="diff" label="难度" width="80"></el-table-column>
      <el-table-column prop="accept" label="通过数" width="110"></el-table-column>
      <el-table-column prop="total" label="提交数" width="110"></el-table-column>
      <el-table-column label="通过率" width="240">
        <template slot-scope="scope">
          <el-progress :percentage="acrate(scope)"></el-progress>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @current-change="currentChange"
      :current-page="1"
      :page-size="problemSet.size"
      layout="prev, pager, next"
      :total="problemSet.total"
      class="pb_pagn"
    ></el-pagination>
  </el-main>
</template>

<script>
import { getProblemSet } from "network/post";
export default {
  components: {},
  data() {
    return {
      problemSet: {
        total: 0,
        size: 20,
        itemList: []
      }
    };
  },
  methods: {
    acrate(scope) {
      if (scope.row.total === 0) return 100;
      return Number(((scope.row.accept / scope.row.total) * 100).toFixed(0));
    },
    currentChange(page) {
      console.log(page);
      getProblemSet(page, 20)
      .then(({ data }) => {
        this.problemSet = data.data;
      })
      .catch(err => {
        console.log(err);
      });
    }
  },
  created() {
    getProblemSet(1, 20)
      .then(({ data }) => {
        this.problemSet = data.data;
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

a {
  text-decoration: none;
}
</style>

