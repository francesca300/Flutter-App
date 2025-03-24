<template>
     <div class="field">
        <label class="label">ID</label>
        <div class="control">
          <input
            class="input"
            type="number"
            placeholder="id"
            v-model="id"
          />
        </div>
        </div>
    <div>
      <div class="field">
        <label class="label">UserName</label>
        <div class="control">
          <input
            class="input"
            type="text"
            placeholder="Username"
            v-model="username"
          />
        </div>
      </div>
  
   
        <div class="field">
        <label class="label">Major</label>
        <div class="control">
          <input
            class="input"
            type="text"
            placeholder="Major"
            v-model="major"
          />
        </div>
    </div>

        <div class="field">
        <label class="label">email</label>
        <div class="control">
          <input
            class="input"
            type="text"
            placeholder="email"
            v-model="email"
          />
        </div>
      </div>
  
      <div class="control">
        <button class="button is-success" @click="saveUser">SAVE</button>
      </div>
    </div>
  </template>
  
  <script>
  //import axios
  import axios from "axios";
  export default {
    data() {
      return {
        
        id: "",
        username: "",
        major:"",
        email:"",
      };
    },
    methods: {
      //create new product
      async saveUser() {
        try {
          await axios.post("http://localhost:5000/users", {
           
            id: this.id,
            username: this.username,
            major:this.major,
            email:this.email,
                  });
          (this.id = ""), (this.username = ""), (this.major = ""), (this.email = "");
          this.$router.push("/");
        } catch (err) {
          console.log(err);
        }
      },
    },
  };
  </script>
  
  <style></style>
  