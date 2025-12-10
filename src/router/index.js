import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../home/HomeView.vue'
import TimelineView from '../timeline/TimelineView.vue'
import MapView from '../map/MapView.vue'
import WeeklyQuizView from '../weekly-quiz/WeeklyQuizView.vue'
import FuturePlansView from '../future-plans/FuturePlansView.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/timeline',
    name: 'timeline',
    component: TimelineView
  },
  {
    path: '/map',
    name: 'map',
    component: MapView
  },
  {
    path: '/weekly-quiz',
    name: 'weekly-quiz',
    component: WeeklyQuizView
  },
  {
    path: '/future-plans',
    name: 'future-plans',
    component: FuturePlansView
  }
]

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
})

export default router
