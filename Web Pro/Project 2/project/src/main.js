// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import firebase from 'firebase'

Vue.config.productionTip = false

// Initialize Firebase
var config = {
  apiKey: "AIzaSyDsN_j_LgVaA17S0rC9erZeERN4mLedrVw",
  authDomain: "egco427-project.firebaseapp.com",
  databaseURL: "https://egco427-project.firebaseio.com",
  projectId: "egco427-project",
  storageBucket: "egco427-project.appspot.com",
  messagingSenderId: "281207958459"
};
firebase.initializeApp(config);
window.firebase = firebase;

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
