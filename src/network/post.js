import axios from 'axios'
// config
axios.defaults.baseURL = "http://www.openjudge.top:8887"

//获取评测结果
let getJudgeStatus = function (pid, page, size) {
  console.log("getJudge")
  let formData = new FormData();
  if (pid != undefined)
    formData.append("pid", pid);
  formData.append("page", page);
  formData.append("size", size);
  return axios
    .post("/submitStatus", formData)

}

//提交
let httpPostSubmit = function (pid, id, language, code) {
  let formData = new FormData();
  formData.append("pid", pid);
  formData.append("uid", id);
  formData.append("language", language);
  formData.append("code", code);
  return axios.post("/submit", formData)
}


//获取题目列表
let getProblemSet = function (page, size) {
  let formData = new FormData();
  formData.append("page", page);
  formData.append("size", size);
  return axios
    .post("/problemset", formData)
}

//用户登录
let httpLogin = function (username, password) {
  let formData = new FormData();
  formData.append("username", username);
  formData.append("password", password);
  //发送登录请求
  return axios
    .post("/login", formData)
}

//用户注册
let httpRegister = function (username, password) {
  let formData = new FormData();
  formData.append("username", username);
  formData.append("password", password);
  //发送登录请求
  return axios
    .post("/register", formData)
}

//检测用户名是否可用
let httpCheckUsernameUsed = function(username) {
  let formData = new FormData();
  formData.append("username", username);
  //发送检测请求
  return axios
    .post("/checkUsernameUsed", formData)
}
export { getJudgeStatus, httpPostSubmit, getProblemSet, httpLogin, httpRegister, httpCheckUsernameUsed }