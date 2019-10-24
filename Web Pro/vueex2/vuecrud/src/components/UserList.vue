<template>
    <div class="container">
        <h1>List of Users</h1>
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <div class="input-group">
                <input type="text"
                class="form-control"
                placeholder="Search for..."
                v-model="search">
                <span>
                  <button class="btn btn-default" type="button">Search
                    <span class="glyphicon glyphicon-search"></span>
                  </button>
                </span>
              </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
          </div><!-- /.row -->
        </div>
        <table class="table table-stripped table-borderes">
            <thead>
                <tr>
                <th class="center">First Name</th>
                <th class="center">Last Name</th>
                <th class="center">Email</th>
                <th class="center">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="auser in filteredUsers" v-bind:key="auser.id">
                  <td class="text-left">{{auser.firstName}}</td>
                  <td class="text-left">{{auser.lastName}}</td>
                  <td class="text-left">{{auser.email}}</td>


                </tr>
            </tbody>
        </table>
    </div> 

    
</template>

<script>
import axios from 'axios'
export default {
  name: 'users',
  data(){
    return{
      Users: [],
      uid: '',
      search: ''
    }
    },computed:{
      filteredUsers:function(){
        return this.Users.filter((user) =>{
          return user.firstName.match(this.search)
        })
      }
    
    },mounted (){
      axios.get('http://localhost:8081/users')
        .then((response)=>{
            console.log(response.data)
            this.Users = response.data
        })
        .catch((error)=>{
          console.log(error)
        })
       }
  }

</script>

<style>

</style>
