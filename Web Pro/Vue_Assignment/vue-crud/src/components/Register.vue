<template>
  <div class="col-sm-6 col-sm-offset-3">  
    <div class="container" style="margin-top:30px">
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading"><h3 class="panel-title"><strong>Register </strong></h3></div>
            <div class="panel-body">
              <form role="form">
                <div class="form-group" >
                  <label class="pull-left">User Account  </label>
                  <input type="text" class="form-control" placeholder="Username" v-model="Auth.Username">
                </div>
                <div class="form-group" >
                  <label class="pull-left">Password</label>
                  <input type="password" class="form-control" placeholder="Password" v-model="Auth.Password">
                </div>
                <div class="form-group">
                  <label for="pull-left">Confirm Password</label>
                  <input type="password" class="form-control" placeholder="Confirm Password" v-model="Auth.ConfirmPassword">
                </div>
                
              </form>
              <button type="submit" class="btn btn-sm btn-default" @click="regisToAPI">Sing Up</button>
                <router-link to="/" tag="button" class="btn btn-sm btn-default">Cancel</router-link>

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
  name: "Register",
  data(){
    return{
      Auth:{
        Username:'',
        Password:'',
        ConfirmPassword:''
      }
    }
  },
  methods:{
    regisToAPI(){
      var thisfunc = this
      if(this.Auth.Password==this.Auth.ConfirmPassword)
      {
        let newAuth = {
          Username: this.Auth.Username,
          Password: this.Auth.Password
        }
        axios.post('http://localhost:3000/register', newAuth)
        .then((response) => {
          console.log(response)
          alert("register successful")
          thisfunc.$router.push({path:'/'})    

        })
        .catch((error) => {
          console.log(error)
          alert("register failed")
        })
      }
      else{
        alert("Password isn't match")
      }
      
    }
  }
  
};
</script>

<style scoped>

</style>
