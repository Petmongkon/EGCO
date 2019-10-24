// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import firebase from 'firebase'

Vue.config.productionTip = false
let app

var config = {
  apiKey: "AIzaSyBcpbkuKiHNW_GdmeXrKZI9vee6W9DaY00",
  authDomain: "egco427-practice.firebaseapp.com",
  databaseURL: "https://egco427-practice.firebaseio.com",
  projectId: "egco427-practice",
  storageBucket: "egco427-practice.appspot.com",
  messagingSenderId: "712653079231"
};

firebase.initializeApp(config);
window.firebase = firebase // use firebase all of project

/* eslint-disable no-new */
// new Vue({
//   el: '#app',
//   router,
//   components: { App },
//   template: '<App/>'
// })


firebase.auth().onAuthStateChanged((user)=>{
  if(!app){
    new Vue({
      el: '#app',
      router,
      components: { App },
      template: '<App/>'
    })
  }
})