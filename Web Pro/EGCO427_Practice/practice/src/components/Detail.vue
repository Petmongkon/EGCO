<template>
  <div>
    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"/>
    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <div v-for="(weather,key) in details.list" :key='key'>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"> {{ weather.name }}</h3>
                </div>
                <div class="panel-body">

                <table class="table table-borderes">
                    <tbody>
                        <tr>
                            <td>
                                <b>Location:</b> { {{weather.coord.lat}}, {{weather.coord.lon}} }
                            </td>
                            <td>
                                <b>Tempurature:</b> {{weather.main.temp_min}}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Pressure:</b> {{weather.main.pressure}}
                            </td>
                            <td>
                                <b>Humidity:</b> {{weather.main.humidity}}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Main Weather:</b> {{weather.weather[0].main}}
                            </td>
                            <td>
                                <b>Description:</b> {{weather.weather[0].description}}
                            </td>
                        </tr>
                    </tbody>
                </table>
                <img v-bind:src="`http://openweathermap.org/img/w/${weather.weather[0].icon}.png`">
                </div>
            </div>
            <br/>
        </div>
    </div>
    <!-- <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"/> -->
     <div class="grid">
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" />
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <button @click="logout" class="btn btn-default"> Logout</button>
          </div>
      </div>

  </div>
</template>

<script>
import axios from 'axios'
export default {
  name:'detail',
  data(){
      return{
          details:{}
      }
  },
    created(){
    var APIKEY='8401c953bf6da750a982308bf17ad82d'
    var url = 'http://api.openweathermap.org/data/2.5/find?q=' + this.$route.params.cityname + '&type=accurate&appid=' + APIKEY
    axios.get(url)
    .then(response=>{
        console.log(response.data)
        this.details = response.data
    })
    .catch(error=>{
        console.log(error)
    })
      
  },
  methods:{
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
}
</script>

<style>

</style>
