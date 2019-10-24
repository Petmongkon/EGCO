<template>  
<div class="ui grid"> 
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
 
    <div class="ten wide centered column"> 
        <div class="ui raised segment"> 
            <form class="ui form"> 
        <div> 
            <h1>Add Contact</h1> 
        </div> 
        <div class="required field"> 
            <label>Contact ID</label> 
            <input type="text" name="first-name" placeholder="Contact ID" v-model="User.ID"> 
        </div> 
    <div class="required field"> 
        <label>First Name</label> 
        <input type="text" name="first-name" placeholder="First Name" v-model="User.Firstname"> 
    </div> 
    <div class="required field"> 
        <label>Last Name</label> 
        <input type="text" name="last-name" placeholder="Last Name" v-model="User.Lastname"> 
    </div> 
    <div class="required field"> 
        <label>Mobile No</label> 
        <input type="text" name="first-name" placeholder="Mobile No" v-model="User.Phone"> 
    </div> 
    <div class="field"> 
        <label>Email</label> 
        <input type="text" name="first-name" placeholder="Email" v-model="User.Email"> 
    </div> 
    <div class="field"> 
        <label>Facebook</label> 
        <input type="text" name="first-name" placeholder="Facebook" v-model="User.Facebook"> 
    </div> 
    <div class="field"> 
        <label>Img Url</label> 
        <input type="text" name="first-name" placeholder="Img Url" v-model="User.Image"> 
    </div> 
 
    <div class="ui buttons"> 
        <button class="large ui teal button" v-on:click="addContact()">Submit</button> 
        <button class="large ui orange button" v-on:click="close()">Close</button> 
    </div> 
    </form> 
        </div> 
        </div> 
</div> 
</template> 
 
<script> 
import axios from 'axios' 
export default { 
  name: '/addUser', 
  
  data () { 
    return { 
      msg: 'Welcome to Your Vue.js App', 
      User:{
              ID: '',
              Firstname: '',
              Lastname: '',
              Phone: '',
              Email: '',
              Facebook: '',
              Image:''
          }
    } 
  }, 
  methods: { 
    addContact () { 
      let newUser = { 
          ID: this.User.ID,
          Firstname: this.User.Firstname,
          Lastname: this.User.Lastname,
          Phone: this.User.Phone,
          Email: this.User.Email,
          Facebook: this.User.Facebook,
          Image: this.User.Image
      } 
      console.log(newUser) 
      axios.post('http://localhost:3000/users', newUser) 
        .then((response) => { 
          console.log(response) 
        }) 
        .catch((error) => { 
          console.log(error) 
        }) 
 
        this.$router.push({path: '/listpage'}) 
    }, 
    close(){ 
        this.$router.push({path: '/listpage'}) 
    } 
  },
  mounted (){
    console.log(" token : "+localStorage.getItem('token'))
    if(localStorage.getItem('token')==null)
    {
        console.log("no token")
        this.$router.push({path:'/'})    
    }
  } 
} 
</script> 
 
<!-- Add "scoped" attribute to limit CSS to this component only --> 
<style scoped> 
h1, h2 { 
  font-weight: normal; 
} 
ul { 
  list-style-type: none; 
  padding: 0; 
} 
li { 
  display: inline-block; 
  margin: 0 10px; 
} 
a { 
  color: #42b983; 
} 
</style>