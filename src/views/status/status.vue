<template>
  <el-main>
    <div style="margin-top: 20px">
      <el-table :data="submitStatus.itemList" stripe>
        <el-table-column prop="rid" label="运行编号" width="120" align="center"></el-table-column>
        <el-table-column prop="pid" label="题目编号" width="120" align="center">
          <template slot-scope="scope">
            <a :href="/problem/+scope.row.pid">{{scope.row.pid}}</a>
          </template>
        </el-table-column>
        <el-table-column label="运行结果" width="130" align="center">
          <template slot-scope="scope">
            <div :style="getStyle(scope)">{{getStatus(scope)}}</div>
          </template>
        </el-table-column>
        <el-table-column label="运行时间" width="120" align="center">
          <template slot-scope="scope">
            <div>{{scope.row.runTime == null ? "" : scope.row.runTime + "ms"}}</div>
          </template>
        </el-table-column>
        <el-table-column label="运行内存" width="120" align="center">
          <template slot-scope="scope">
            <div>{{scope.row.runMemory == null ? "" : scope.row.runMemory + "KB"}}</div>
          </template>
        </el-table-column>
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
  </el-main>
</template>

<script>
import { getJudgeStatus } from "network/post";
export default {
  data() {
    return {
      submitStatus: {
        total: 0,
        size: 20,
        itemList: []
      },
      statusText: [
        "等待评测",
        "队列中",
        "正在编译",
        "编译错误",
        "正在运行",
        "运行错误",
        "时间超限",
        "内存超限",
        "输出超限",
        "答案错误",
        "格式错误",
        "答案正确"
      ],
      statusColor: [
        "#6633ff",
        "#6633ff",
        "#6633ff",
        "#ff0000",
        "#6633ff",
        "#ff0000",
        "#ff0000",
        "#ff0000",
        "#ffa500",
        "#ff0000",
        "#ffa500",
        "#00aa00"
      ]
    };
  },
  methods: {
    //status翻页
    currentChange(page) {
      getJudgeStatus(this.$route.params.pid, page, 20)
        .then(({ data }) => {
          if (data.success === true) {
            this.submitStatus = data.data;
          }
        })
        .catch(err => {
          console.log(err);
        });
        this.$forceUpdate();
    },
    getStatus(scope) {
      if (scope.row.status == -1) return "系统错误";
      return this.statusText[scope.row.status];
    },
    getStyle(scope) {
      return "color: " + this.statusColor[scope.row.status];
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