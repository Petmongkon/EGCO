<template>
  <div class="form">
    <h4> {{msg}} </h4>
    <div class="container">
      <button @click="logout" class="btn btn-default"><span class="glyphicon glyphicon-log-out"></span> Logout</button>
    </div>
    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"/>
    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
      <div class="panel panel-info" >
            <div class="panel-heading">
              <img class="news-img" src="https://www.petful.com/wp-content/uploads/2014/10/Samoyed.jpg" alt="Card image cap">
                <h3 class="panel-title">Add New Movie</h3>
            </div>
            <div class="panel-body">
        <input type="text" v-model='movie' class="form-control" @keyup.enter='addMovie'>
            </div>
      </div>
        <!--Display movie list-->
        <div class="panel panel-info" >
            <div class="panel-heading">
                <h3 class="panel-title">List of Movies (Update/Delete)</h3>
            </div>
            <div class="panel-body">
                <ul>
                <li v-for="(movieName,key) in movies" :key='key'>
                    <div class="row">
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <p><b>{{movieName.name}}</b></p>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <input type="text" v-model="editName[key]" class="form-control" @keyup.enter="editMovie(key)">
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <button class="btn btn-xs btn-warning" @click="editMovie(key)">Update</button>
                        <button class="btn btn-xs btn-danger" @click="deleteMovie(key)">Delete</button>
                        </div>
                    </div>
                    <br>
                </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"/>

    <button @click="savePDF">PDF</button>

  </div>
</template>

<script>
import jsPDF from 'jsPDF'
import html2canvase from 'html2canvas'
export default {
  name: "MovieList",
  data() {
    return {
      msg: "Vue.js: Firebase CRUD Web Application",
      movie: null,
      movies: [],
      editName: [],
      test:{name:'WTF'},
      a4 : [595.28, 841.89],
      form : $('.form'),  
    };
  },
  created() {
    firebase
      .database()
      .ref("movies")
      .on("value", snapshot => {
        console.log(snapshot.val())
        this.movies = snapshot.val();
      });
  },
  methods: {
    savePDF(){
      // let doc = new jsPDF('p','pt','a4');
      
      // doc.addHTML(document.body,function() {
      //     doc.save('html.pdf');
      // });

      this.getCanvas().then(function (canvas) {  
                var  
                 img = canvas.toDataURL("image/png"),  
                 doc = new jsPDF({  
                     unit: 'px',  
                     format: 'a4'  
                 });  
                doc.addImage(img, 'JPEG', 20, 20);  
                doc.save('Bhavdip-html-to-pdf.pdf');  
                form.width(cache_width);  
            });  

      
    },
    getCanvas(){
      this.form.width((this.a4[0] * 1.33333) - 80).css('max-width', 'none');  
            return html2canvas(this.form, {  
                imageTimeout: 2000,  
                removeContainer: true  
            });
    }
    ,
    addMovie() {
      firebase
        .database()
        .ref("movies")
        .push({ name: this.movie })
        .then(data => {
          console.log(data);
          this.movie=''
        })
        .catch(error => {
          console.log(error);
        });
    },
    editMovie(key) {
      new Promise((resolve,reject)=>{
          firebase.database().ref('movies').push({
        name:'ff'
      })
      .then(res=>{
          firebase.database().ref('movies').push({
            name:'ii'
          })
          .then(res=>{
            firebase.database().ref("movies/" + key).set(this.test)
            .then(res=>{
              console.log(kycs)
              console.log('0')
            })
            .catch(err=>{
              console.log('1')
            })
          })
          .catch(err=>{
            console.log('2 '+err)
            reject()
          })
          
      })
      .catch(err=>{
        console.log('3')
      })
    })
      .then(pro=>{
        console.log('pro')
      })
      .catch(mise=>{
        console.log('mise')
      })
      
      
      
      
    },
    deleteMovie(key) {
      firebase
        .database()
        .ref("movies/" + key)
        .remove();
    },
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

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
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
