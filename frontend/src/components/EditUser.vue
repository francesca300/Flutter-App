<template>
    <div>
    
  
     <div class="field">
        <label class="label">ID</label>
        <div class="control">
          <input
            class="input"
            type="text"
            placeholder="ID"
            v-model="id"
          />
        </div>
      </div>
      <div class="field">
        <label class="label">Username</label>
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
            placeholder="major"
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
        <button class="button is-success" @click="updateUserById">UPDATE</button>
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
        major: "",
        email: "",
        


      };
    },
    created: function () {
      this.getUserById();
    },
    methods: {
      //get product by id
      async getUserById() {
        try {
          const response = await axios.get(
            `http://localhost:5000/users/${this.$route.params.id}`
          );
          this.id = response.data.id;
          this.username = response.data.username;
          this.major = response.data.major;
          this.email = response.data.email;
        } catch (err) {
          console.log(err);
        }
      },
      
  
      //update product
      async updateUserById() {
        try {
          await axios.put(
            `http://localhost:5000/users/${this.$route.params.id}`,
            {
              id: this.id,
              username: this.username,
              major: this.major,
              email: this.email,
            }
          );
          (this.id= "") (this.username = ""), (this.major = ""), (this.email = "");
          this.$router.push("/");
        } catch (err) {
          console.log(err);
        }
      },
    },
  };
  </script>
  
  <style></style>
  