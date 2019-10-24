<template>
  <div class="skills">
    <h1>{{ msg }}</h1>
    
    <div class = "holder">
      <!-- @submit.prevent -> v-on:submit -->
      <form @submit.prevent = "addSkill">
        <input type="text" placeholder="Enter a skill ..." v-model="skill">
        <p class="alert" v-if="errors.has('skill')">{{ error.first('skill')}}</p>
      </form>
      <ul>
        <li v-for="(data,index) in skills" :key="index">{{index+1}}. {{data.skill}}</li>
      </ul>
    </div>
    <!-- <p v-if="skills.length<=1">You have less than or equal to one skill.</p>
    <p v-else>You have more than one skills.</p>
    <div v-bind:class="{alert: alertObject.alert}"></div>
    <button v-on:click="changeName">change name</button> -->
  </div>
</template>

<script> 
export default {
  name: 'Skill',
  data () {
    return {
      msg: 'Skill list',
      name: 'Bob Cat',
      skill: "",
      skills: [
        {"skill": "Vue.js"},
        {"skill": "ES6"}
      ],
      alertObject: {
        alert: true
      }
    }
  },
  methods: {
    changeName: function(){
      this.name = "Tim Foxx"
      alert('change to '+this.name)
    },
    addSkill: function(){
      this.$validator.validateAll().then((result) => {
        if(result){
          this.skills.push({ skill: this.skill })
          this.skill = ""
        } 
        else{
          console.log('Not valid!')
        }
      })
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

  .holder {
    background: #fff;
  }

  ul {
    margin: 0;
    padding: 0;
    list-style-type: none;
  }
  
  ul li {
    padding: 20px;
    font-size: 1.3em;
    background-color: #E0EDF4;
    border-left: 5px solid #3EB3F6;
    margin-bottom: 2px;
    color: #3E5252;
  }

  p {
    text-align:center;
    padding: 30px 0;
    color: gray;
  }

  .container {
    box-shadow: 0px 0px 40px lightgray;
  }

  input {
    width: calc(100% - 40px);
    border: 0;
    padding: 20px;
    font-size: 1.3em;
    background-color: #323333;
    color: #687F7F;
  }
</style>
  
