<template>
  <div>
    <div class="pb-label">题目描述</div>
    <el-input
      type="textarea"
      readonly
      resize="none"
      autosize
      v-model="problem.description"
      class="pb-text"
    ></el-input>
    <div class="pb-label">输入描述</div>
    <el-input
      type="textarea"
      readonly
      resize="none"
      autosize
      v-model="problem.input"
      class="pb-text"
    ></el-input>
    <div class="pb-label">输出描述</div>
    <el-input
      type="textarea"
      readonly
      resize="none"
      autosize
      v-model="problem.output"
      class="pb-text"
    ></el-input>
    <div v-for="(item, index) in problem.samples" :key="index">
      <div class="pb-label">
        示例输入{{index+1}}
        <el-button
          round
          size="small"
          @click="sampleCopy('input', index, $event)"
          style="float: right"
        >复制</el-button>
      </div>
      <el-input
        type="textarea"
        readonly
        resize="none"
        autosize
        v-model="item.input"
        class="pb-text"
      ></el-input>
      <div class="pb-label">
        示例输出{{index+1}}
        <el-button
          round
          size="small"
          @click="sampleCopy('output', index, $event)"
          style="float: right"
        >复制</el-button>
      </div>
      <el-input
        type="textarea"
        readonly
        resize="none"
        autosize
        v-model="item.output"
        class="pb-text"
      ></el-input>
    </div>
    <div class="pb-label">作者</div>
    <el-input
      type="textarea"
      readonly
      resize="none"
      autosize
      v-model="problem.author"
      class="pb-text"
    ></el-input>
  </div>
</template>

<script>
import { httpGetProblemDetail } from "network/get";
export default {
  data() {
    return {
      problem: {}
    };
  },
  methods: {
    //提供复制样例功能
    sampleCopy(ope, index, e) {
      let text = "";
      if ("input" === ope) text = this.problem.samples[index].input;
      else text = this.problem.samples[index].output;
      const clipboard = new ClipBoard(e.target, { text: () => text });
      clipboard.on("success", e => {
        this.$message({ type: "success", message: "复制成功" });
        clipboard.destroy(); // 释放内存
      });
      clipboard.on("error", e => {
        this.$message({ type: "waning", message: "该浏览器不支持自动复制" });
        clipboard.destroy(); // 释放内存
      });
      clipboard.onClick(e); // 事件绑定
    }
  },
  created() {
    httpGetProblemDetail(this.$route.params.pid)
      .then(({ data }) => {
        if (data.success === true) {
          this.problem = data.data;
          this.$store.commit("setTitle", this.problem.title);
        }
      })
      .catch(err => {
        console.log(err);
      });
  }
};
</script>

<style scoped>
.pb-text {
  font-size: 24px;
}

.pb-label {
  margin: 15px 10px;
  font-size: 24px;
}
</style>