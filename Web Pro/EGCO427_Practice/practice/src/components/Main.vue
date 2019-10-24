<template>
    <div>
        <h1>EGCO427 Practice</h1>
          <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2"/>
          <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
            <div class="panel panel-info">
            <div class="panel-heading">
              <h2 class="panel-title">List of Cities</h2>
            </div>
            <div class="panel-body">
            <div v-for="(cityName,key) in cities" :key='key' class="col-sm-6 col-md-4 ">
                <div class="thumnail">
                  <img class="card-img-top" v-bind:src="`/static/img/${cityName.image}`" width=60% height=60% alt="Card image">
                  <div  class="card-body">
                  <h4 class="card-title">{{cityName.name}}</h4>
                  <p class="card-text">{{cityName.detail}}</p>
                  <router-link :to="{ path: 'detail/' + cityName.name}" class="btn btn-sm btn-success " tag="button" type="button">
                    <span>Detail</span>
                  </router-link>
                </div>
                </div>
                
            </div>
            </div>
            </div>
            

            </div> 
        
      <div class="grid">
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" />
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <button @click="logout" class="btn btn-default"> Logout</button>
          </div>
      </div>
    </div>
  
</template>

<script>
export default {
    name: "Main",
  data() {
    return {
      msg: "Vue.js: Firebase CRUD Web Application",
      cities: [],
    };
  },
  created() {
    firebase
      .database()
      .ref("cities")
      .on("value", snapshot => {
          snapshot.forEach(element => {
              this.cities.push(element.val())
              console.log(element.val())
          });
    });
  },
  methods: {
    logout(){
      firebase.auth().signOut()
        .then(()=>{
          this.$router.replace('/signin')
        })
        .catch((e)=>{
          alert(e.message)
        })
    }
  }
};
  

</script>

<style scoped >
h1,
h2 {
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
