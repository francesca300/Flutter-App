import { createRouter, createWebHistory } from "vue-router";



import IndexView from "@/views/IndexView.vue";
import CreateView from "../views/CreateView.vue";
import EditView from "@/views/EditView.vue";

const routes = [
  {
    name: "Index",
    path: "/",
    component: IndexView,
  },
  {
    name: "Edit",
    path: "/edit/:id",
    component: EditView,
  },
  {
    name: "Create",
    path: "/create",
    component: CreateView,
  },
  {
    path: "/aboutview",
    name: "About",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/AboutView.vue"),
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
