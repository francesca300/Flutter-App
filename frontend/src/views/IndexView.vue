<template>
    <div>
      <UserList />
    </div>
  </template>
  
  <script>
  // @ is an alias to /src
import UserList from "@/components/UserList.vue";
  
  export default {
    name: "IndexView",
    components: {
      UserList,
    },
  };
  </script>
  