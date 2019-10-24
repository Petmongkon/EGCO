<template>
    <div class="row">
        <h2>SignUp</h2>
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 col-md-offset-3"/>
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-md-offset-3">

            <input type="email" v-model="formData.email" class="form-control" placeholder="email">
            <br>
            <input type="password" v-model="formData.password" class="form-control" placeholder="password">
            <br>
            <button class="btn btn-success" @click="signUp">SignUp</button>
        </div>
    </div>
</template>
<script>
export default {
  name: 'SignUp',
  data(){
      return{
          formData:{
              email: '',
              password: '',
          }
      }
  },
  methods:{
      signUp(){
          console.log('signup')
          var thisfunc = this
            firebase.auth().createUserWithEmailAndPassword(this.formData.email,this.formData.password)
            .then( user=> {
                console.log(this.formData.email,this.formData.password)
                thisfunc.$router.replace('/main')
            })
            .catch( e =>{
                console.log(e.message)
                alert(e.message)
            })
      }
  }
}
</script>

