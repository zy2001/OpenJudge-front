<template>
  <el-main>
    <h2 style="text-align: center">{{problem.title}}</h2>
    <el-tabs v-model="activeName"  @tab-click="handleClick">
    <el-tab-pane label="题目信息" name="detail">
      <div class="pb-label">题目描述</div>
      <el-input type="textarea" readonly resize="none" autosize v-model="problem.description" class="pb-text"></el-input>
      <div class="pb-label">输入描述</div>
      <el-input type="textarea" readonly resize="none" autosize v-model="problem.input" class="pb-text"></el-input>
      <div class="pb-label">输出描述</div>
      <el-input type="textarea" readonly resize="none" autosize v-model="problem.output" class="pb-text"></el-input>
      <div v-for="(item, index) in problem.samples" :key="index">
        <div class="pb-label">示例输入{{index+1}}<el-button round size="small" @click="sampleCopy('input', index, $event)" style="float: right">复制</el-button></div>
        <el-input type="textarea" readonly resize="none" autosize v-model="item.input" class="pb-text"></el-input>
        <div class="pb-label">示例输出{{index+1}}<el-button round size="small" @click="sampleCopy('output', index, $event)" style="float: right">复制</el-button></div>
        <el-input type="textarea" readonly resize="none" autosize v-model="item.output" class="pb-text"></el-input>
      </div>
      <div class="pb-label">作者</div>
      <el-input type="textarea" readonly resize="none" autosize v-model="problem.author" class="pb-text"></el-input>
    </el-tab-pane>
    <el-tab-pane label="提交代码" name="submit">
      <el-form :model="submit" ref="submit" >
        <el-form-item  prop="language" label="提交语言">
          <el-select v-model="submit.language">
            <el-option label="C" value="C"></el-option>
            <el-option label="C++" value="C++"></el-option>
            <el-option label="JAVA" value="JAVA"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item prop="code" label="源代码">
          <el-input type="textarea" :autosize="{ minRows: 21, maxRows: 25}" :rows="2" v-model="submit.code"></el-input>
        </el-form-item>
        <el-form-item style="text-align: right">
          <el-button plain >提交</el-button>
          <el-button plain @click="resetForm('submit')">重置</el-button>
        </el-form-item>
      </el-form>
    </el-tab-pane>
    <el-tab-pane label="提交状态" name="status">角色管理</el-tab-pane>
    </el-tabs>
  </el-main>
</template>

<script>
import ClipBoard from 'clipboard'
export default {
  data() {
    return {
      activeName: "detail",
      problem: {
        pid: '',
        title: '',
        description: '',
        diff: '',
        input: '',
        output: '',
        author: '',
        samples: []
      },
      submit: {
        language: 'C++',
        code: ''
      }
    };
  },
  methods: {
    sampleCopy(ope, index, e) {
      let text = "";
      if("input"===ope) text = this.problem.samples[index].input
      else text = this.problem.samples[index].output
      const clipboard = new ClipBoard(e.target, {text : ()=> text})
      clipboard.on('success', e => {
        this.$message({ type: 'success', message: '复制成功' })
        clipboard.destroy()         // 释放内存
      })
      clipboard.on('error', e => {
        this.$message({ type: 'waning', message: '该浏览器不支持自动复制' })
        clipboard.destroy()         // 释放内存
      })
      clipboard.onClick(e)  // 事件绑定
    },
    handleClick(tab, event) {
      console.log(tab, event);
    },
    resetForm(formName){
      console.log(formName)
      this.$refs[formName].resetFields()
    }
  },
  created() {
    console.log('problem' + this.$route.params.pid+'created')
    this.$http
      .get("/problem/" + this.$route.params.pid)
      .then(res => {
        console.log(res)
        if(res.data.success === true){
          let data = res.data.data
          this.problem.pid = data.pid
          this.problem.title = data.title
          this.problem.description = data.description
          this.problem.diff = data.diff
          this.problem.input = data.input;
          this.problem.output = data.output
          this.problem.samples = data.samples
          this.problem.author = data.author
        }
      })
      .catch(err => {
        console.log(err)
      })
  }
};
</script>

<style scoped>
/* .el-main {
  min-height: 850px;
} */

.pb-text {
  font-size: 24px;
}

.pb-label {
  margin: 15px 10px;
  font-size: 24px;
}
</style>