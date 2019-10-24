<template>
  <div id="app">
    <nav class="navbar navbar-default ">
      <a class="navbar-brand" href="#">
        <img src="/static/img/planelogo.png" width="30" height="30" class="d-inline-block align-top" alt="">
      </a>
      <div class="navbar-header">
          <a class="navbar-brand" href="/">Home</a>
      </div>
    </nav>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
