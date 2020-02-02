import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'

import './plugins/element.js'
import './assets/css/gloable.css'
import 'element-ui/lib/theme-chalk/index.css'

Vue.config.productionTip = false

// axios.defaults.baseURL = "http://www.openjudge.top:8887"
// axios.defaults.baseURL = "http://121.36.13.125:8887"
// axios.defaults.baseURL = "http://www.openjudge.online:8887"
axios.defaults.baseURL = "http://localhost:8887"
Vue.prototype.$http = axios



new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
