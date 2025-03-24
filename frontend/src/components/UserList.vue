<template>
    <div>
      <router-link :to="{ name: 'Create' }" class="button is-success mt-5"
        >Add New</router-link
      >
      <table class="table is-striped is-bordered mt-2 is-fullwidth">
        <thead>
          <tr>
            <th>ID</th>
            <th>User Name</th>
            <th>Major</th>
            <th>email</th>
            <th class="has-text-centered">Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in items" :key="item.id">
            <td>
              {{ item.ID }}
            </td>
            <td>{{ item.username }}</td>
            <td>
              {{ item.major }}
            </td>
            <td>{{ item.email }}</td>
            <td class="has-text-centered">
              <router-link
                :to="{ name: 'Edit', params: { id: item.id } }"
                class="button is-info is-small"
                >Edit</router-link
              >
              <a
                class="button is-danger is-small"
                @click="deleteUser(item.id)"
                >Delete</a
              >
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script>
  //import axios
  import axios from "axios";
  
  export default {
    data() {
      return {
        items: [],
      };
    },
    created() {
      this.getUser();
    },
    methods: {
      //get all products
      async getUser() {
        try {
          const response = await axios.get("http://localhost:5000/users");
          this.items = response.data;
          console.log(this.items);
        } catch (err) {
          console.log(err);
        }
      },
      //delete product
      async deleteUser(id) {
        try {
          await axios.delete(`http://localhost:5000/users/${id}`);
          this.getUser();
        } catch (err) {
          console.log(err);
        }
      },
    },
  };
  </script>
  
  <style></style>
  