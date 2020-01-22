<template>
  <el-main>
    <el-table :data="problemSet" stripe class="problem_table">
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
    <el-pagination @current-change="currentChange" :current-page="5" :page-size="size" layout="prev, pager, next" :total="total" class="pb_pagn"></el-pagination>
  </el-main>
</template>

<script>
// import MyTable from "components/content/problemset/table";
export default {
  components: {
    // MyTable
  },
  data() {
    return {
      total: 1000,
      size: 20,
      problemSet: [
        {
          pid: 1,
          title: "A + B Problem",
          diff: 1,
          accept: 35,
          total: 38
        },
        {
          pid: 2,
          title: "A + B Problem ii",
          diff: 2,
          accept: 300,
          total: 328
        },
        {
          pid: 3,
          title: "A + B Problem iii",
          diff: 3,
          accept: 315,
          total: 338
        },
        {
          pid: 4,
          title: "A + B Problem iv",
          diff: 3,
          accept: 135,
          total: 238
        },
        {
          pid: 1,
          title: "A + B Problem",
          diff: 1,
          accept: 35,
          total: 38
        },
        {
          pid: 2,
          title: "A + B Problem ii",
          diff: 2,
          accept: 300,
          total: 328
        },
        {
          pid: 3,
          title: "A + B Problem iii",
          diff: 3,
          accept: 315,
          total: 338
        },
        {
          pid: 4,
          title: "A + B Problem iv",
          diff: 3,
          accept: 135,
          total: 238
        },
        {
          pid: 1,
          title: "A + B Problem",
          diff: 1,
          accept: 35,
          total: 38
        },
        {
          pid: 2,
          title: "A + B Problem ii",
          diff: 2,
          accept: 300,
          total: 328
        },
        {
          pid: 3,
          title: "A + B Problem iii",
          diff: 3,
          accept: 315,
          total: 338
        },
        {
          pid: 4,
          title: "A + B Problem iv",
          diff: 3,
          accept: 135,
          total: 238
        },
        {
          pid: 1,
          title: "A + B Problem",
          diff: 1,
          accept: 35,
          total: 38
        },
        {
          pid: 2,
          title: "A + B Problem ii",
          diff: 2,
          accept: 300,
          total: 328
        },
        {
          pid: 3,
          title: "A + B Problem iii",
          diff: 3,
          accept: 315,
          total: 338
        },
        {
          pid: 4,
          title: "A + B Problem iv",
          diff: 3,
          accept: 135,
          total: 238
        },
        {
          pid: 1,
          title: "A + B Problem",
          diff: 1,
          accept: 35,
          total: 38
        },
        {
          pid: 2,
          title: "A + B Problem ii",
          diff: 2,
          accept: 300,
          total: 328
        },
        {
          pid: 3,
          title: "A + B Problem iii",
          diff: 3,
          accept: 315,
          total: 338
        },
        {
          pid: 4,
          title: "A + B Problem iv",
          diff: 3,
          accept: 0,
          total: 0
        }
      ]
    };
  },
  computed: {},
  methods: {
    acrate(scope) {
      if (scope.row.total === 0)
        return 100
      return Number(((scope.row.accept / scope.row.total) * 100).toFixed(0))
    },
    currentChange(page) {
      console.log(page)
    }
  },
  created() {
    console.log('problemSet created')
    let formData = new FormData()
    formData.append('page', 1)
    formData.append('size', 20)
    console.log(formData)
    this.$http
      .post("/problemset", formData)
      .then(res => {
        console.log(res)
        this.problemSet = res.data.data.itemList
        this.total = res.data.data.total
        this.size = res.data.data.size
      })
      .catch(err => {
        console.log(err)
      })
  }
};
</script>

<style scoped>
.pb_pagn {
  float: right;
  padding: 20px;
}

.problem_table {
  min-height: 800px;
}
a{
    text-decoration: none;
}
</style>

