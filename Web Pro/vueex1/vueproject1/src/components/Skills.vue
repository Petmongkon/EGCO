<template>
  <div class="skills">
    <h1>{{ msg }}</h1>
    <div class="holder">
      <!-- @subimt="" ->v-on:submit=""-->
      <form @submit.prevent="addSkill">
        <input type="text" placeholder="Enter a skill.."
        v-model="skill">
        <p class="alert" v-if="errors.has('skill')">{{error.first('skill')}}</p>
      </form>
      <ul>
        <li v-for="(data, index) in skills" :key='index'>{{index}}.{{data.skill}}</li>
      </ul>
      <div v-bind:class="{ alert: showAlert }">

      </div>
      <p v-if="skills.length<2">You have less than or equal one skill</p>
      <p v-else>You have more than one skill</p>
      
    </div>
      
    <button v-on:click="changeName">Change Name</button>
    
      
  </div>
</template>

<script>
export default {
  name: "Skills",
  data() {
    return {
      msg: "Skill Lists",
      name: "bob cat",
      skill: "",
      skills: [{ skill: "Vye.js" }, { skill: "ES6" }],
      showAlert: true
    };
  },
  methods: {
    changeName() {
      // alert('alert jaa')
      this.name = "tim fox";
    },
    addSkill() {
      this.$validator.validateAll().then(result => {
        if (result) {
          this.skills.push({ skill: this.skill });
          this.skill = "";
        }
        else{
          console.log('Not valid')
        }
      });
    }
  }
};
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
  background-color: #e0edf4;
  border-left: 5px solid #3eb3f6;
  margin-bottom: 2px;
  color: #3e5252;
}

p {
  text-align: center;
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
  color: #687f7f;
}
</style>
 
  