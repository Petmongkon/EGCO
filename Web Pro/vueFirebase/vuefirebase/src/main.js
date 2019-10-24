// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import firebase from 'firebase'

Vue.config.productionTip = false

// Initialize Firebase
var config = {
  apiKey: "AIzaSyDd_49oYSiY0rPWa50aqk1OGBJAp33rJC0",
  authDomain: "egco427-lecture-ea7da.firebaseapp.com",
  databaseURL: "https://egco427-lecture-ea7da.firebaseio.com",
  projectId: "egco427-lecture-ea7da",
  storageBucket: "egco427-lecture-ea7da.appspot.com",
  messagingSenderId: "214739454310"
};
firebase.initializeApp(config);
window.firebase = firebase // use firebase all of project

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
