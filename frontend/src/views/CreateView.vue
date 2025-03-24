<template>
  <div>
    <AddUser />
  </div>
</template>

<script>
// @ is an alias to /src
import AddUser from "@/components/AddUser.vue";

export default {
  name: "CreateView",
  components: {
    AddUser,
  },
};
</script>
