<template>
    <div>
      <EditUser />
    </div>
  </template>
  
  <script>
  // @ is an alias to /src
  
import EditUser from "@/components/EditUser.vue";
  
  export default {
    name: "EditView",
    components: {
      EditUser,
    },
  };
  </script>
  