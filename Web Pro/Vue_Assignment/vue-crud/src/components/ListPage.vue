<template>
  <div class="ListPage">

        <div class="ui centered grid">
            <div class="fourteen wide column">
                <div class="ui  raised  segment">
                    <div class="ui  grid">
                        <div class="sixteen wide column">
                            <div class="ui green raised segment">
                                <div class="ui grid">
                                    
                                        
                                    <div class="fourteen wide column">
                                        
                                        <div class="ui fluid category search">
                                            <div class="ui fluid action input">
                                                <button class="ui teal left ribbon label">Login</button>
                                                
                                                <input type="text" placeholder="Search..." v-model="search">
                                                <div class="ui button" >Search</div>
                                                 <button class="ui orange button" @click="addUser">+Add</button>
                                            </div>
                                            <div class="results"></div>
                                            
                                           
                                        </div>
                                    
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="ui centered grid">
            <div class="fourteen wide column">
                <div class="ui  raised  segment">
                </div>
            </div>
        </div>
                
                    <div class="ui centered grid">
                        <div class="fourteen wide column">
                            <div class="ui  raised  segment">
                                <div class="ui grid">
                                <div class="four wide column" v-for="(i,index) in filteredUsers" v-bind:key="index">
                                    <div class="column">
                                <div class="ui card">
                                <div class="image">
                                  <img v-bind:src="i.Image">
                                </div>
                                <div class="content">
                                    <a class="header">{{i.Firstname}} {{i.Lastname}}</a>
                                    <div class="description">
                                        <div>Mobile : {{i.Phone}}</div>
                                        <div>Email : {{i.Email}}</div>
                                        <div>Facebook : {{i.Facebook}}</div>
                                    </div>
                                </div>
                                <div class="extra content">
                                    <a>
                                    
                                    <button class="ui primary button" @click="editUser(i._id)">
                                    Edit
                                    </button>
                                    <button class="red ui button" @click="delUser(i._id)">
                                    Delete
                                    </button>

                                    </a>
                                </div>
                                </div>

                            </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                    
                
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: '/ListPage',
  data(){
    return {
      Users: [],
      search:'',
    }
    
  },
  methods:{
    addUser(){
      this.$router.push({ path: '/adduser'})
    },
    editUser(id){
      console.log(id)
      this.$router.push({ name: '/EditUser' ,params: {uid: id}})
    },
    delUser (userId) {
      console.log(userId)
        var url = 'http://localhost:3000/users/' + userId
        axios.delete(url)
          .then((response) => {
            console.log('Delete UserId: ' + userId)
            axios.get('http://localhost:3000/users')
        .then((response)=>{
            console.log(response.data)
            this.Users = response.data
        })
        .catch((error)=>{
          console.log(error)
        })
          })
          .catch((error) => {
            console.log(error)
          })
    
    },
    
  },
  computed: {
    filteredUsers: function () {
      return this.Users.filter((user) => {
        return user.Firstname.toLowerCase().match(this.search.toLowerCase())||user.Lastname.toLowerCase().match(this.search.toLowerCase())
      })
    }
  },
  mounted (){
    console.log(" token : "+localStorage.getItem('token'))
    if(localStorage.getItem('token')==null)
    {
        console.log("no token")
        this.$router.push({path:'/'})
        
    }
    else{
        axios.get('http://localhost:3000/users')
        .then((response)=>{
            console.log(response.data)
            this.Users = response.data
        })
        .catch((error)=>{
          console.log(error)
        })
    }
    
  }
}

  

</script>

<style scoped>

</style>
