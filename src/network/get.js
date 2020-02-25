import axios from 'axios'
// config
axios.defaults.baseURL = "http://www.openjudge.top:8887"

let httpGetProblemDetail = function (pid) {
  return axios
    .get("/problem/" + pid)
}

export { httpGetProblemDetail }