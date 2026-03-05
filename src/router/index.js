import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../home/HomeView.vue";
import TimelineView from "../timeline/TimelineView.vue";
import MapView from "../map/MapView.vue";
import WeeklyQuizView from "../weekly-quiz/WeeklyQuizView.vue";
import FuturePlansView from "../future-plans/FuturePlansView.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/timeline",
    name: "timeline",
    component: TimelineView,
  },
  {
    path: "/map",
    name: "map",
    component: MapView,
  },
  {
    path: "/weekly-quiz",
    name: "weekly-quiz",
    component: WeeklyQuizView,
  },
  {
    path: "/future-plans",
    name: "future-plans",
    component: FuturePlansView,
  },
];

export const router = createRouter({
  history: createWebHistory(),
  routes,
  scrollBehavior() {
    return { top: 0 };
  },
});

router.beforeEach((to, _) => {
  const main = document.querySelector("body");
  setTimeout(() => {
    main.scrollTo({ top: 0});
  })
});

export default router;
