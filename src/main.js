import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

import './plugins/element.js'
import './assets/css/gloable.css'
import 'element-ui/lib/theme-chalk/index.css'
// import { Main } from 'element-ui'

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

