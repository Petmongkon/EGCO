<template>
  <div class="col-sm-3 col-sm-offset-3">  
    <div class="container center" style="margin-top:30px">
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading"><h3 class="panel-title"><strong>Sign In </strong></h3></div>
            <div class="panel-body">
              <label>{{message}}</label>
              <form role="form">
                <div class="form-group" >
                  <label class="pull-left">User Account  </label>
                  <input type="text" class="form-control" placeholder="Username" v-model="Auth.Username">
                </div>
                <div class="form-group" >
                  <label class="pull-left">Password </label>
                  <input type="text" class="form-control" placeholder="Password" v-model="Auth.Password">
                </div>
                
              </form>
              <button type="submit" class="btn btn-sm btn-default" @click="authenticate">Log in</button>
              <router-link to="/register" tag="button" class="btn btn-sm btn-default">Register</router-link>

            </div>
          </div>
        </div>
      </div>
      <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  </div>
  
</template>

<script>
import axios from 'axios'
export default {
  name: "LogIn",
  data(){
    return{
      Auth:{
        Username:'',
        Password:''
      },
      Token:{
        success:'',
        token:''
      }
    }
  },
  methods:{
    authenticate(){
      let thisfunc = this
      let newAuth = {
        Username:this.Auth.Username,
        Password:this.Auth.Password
      }
      axios.post('http://localhost:3000/authenticate',newAuth)
      .then(function(response){
          if(response.data.success)
          {
            console.log(response.data.token)
            localStorage.setItem('token', response.data.token)
            thisfunc.$router.push({ name: '/ListPage'})
          }
          else{
            this.message="Invalid Username or password"
          }
        
      })
    }
  }
};
</script>

<style scoped>

.center{
  align-content: center;
}

</style>
