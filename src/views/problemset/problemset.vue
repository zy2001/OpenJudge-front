<template>
  <el-main>
    <el-table :data="problemSet.itemList" stripe>
      <el-table-column prop="pid" label="#" width="80"></el-table-column>
      <el-table-column label="题目" width="520">
        <template slot-scope="scope">
          <a :href="'/problem/' + scope.row.pid">{{scope.row.title}}</a>
        </template>
      </el-table-column>
      <el-table-column label="难度" width="80" align="center">
        <template slot-scope="scope">
          <el-tag :type="diffStyle(scope)">{{diffText(scope)}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="accept" label="通过数" width="110" align="center"></el-table-column>
      <el-table-column prop="total" label="提交数" width="110" align="center"></el-table-column>
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
    diffStyle(scope) {
      if (scope.row.diff === "1") return "";
      if (scope.row.diff === "2") return "warning";
      if (scope.row.diff === "3") return "danger";
    },
    diffText(scope) {
      if (scope.row.diff === "1") return "简单";
      if (scope.row.diff === "2") return "中等";
      if (scope.row.diff === "3") return "困难";
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
  activated() {
    this.currentChange(1);
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

