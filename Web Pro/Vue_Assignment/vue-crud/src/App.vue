<template>
  <div id="app">
    <div class="ui top fixed inverted menu">
            <div class="left menu">
            <div class="ui image">
                <svg width="50" height="50">
                    <image xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="@/assets/logo.png" x="5" y="5" width="80%" height="80%"></image>
                </svg>
            </div>
        <a class="item">Contact</a>
            </div>
            <div class="right menu">
                <a class="item"><i class="user icon"></i></a>
            </div>
        </div>
    <router-view/>
  </div>
</template>

<script>
export default {
  name: "App"
};
</script>

<style>
@import url('https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css');
@import url('https://code.jquery.com/jquery-3.2.1.slim.min.js');
@import url('https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js');
@import url('https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js');
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  justify-items: center;
  margin-top: 60px;
}
</style>
