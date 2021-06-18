<template>
  <div class="wrapper">
    <notifications></notifications>
    <side-bar>
      <template slot="links">
        <sidebar-item
          :link="{
            name: '홈',
            path: '/dashboard',
            icon: 'ni ni-shop text-primary',
          }"
        >
        </sidebar-item>

        <sidebar-item
          :link="{
            name: '공지사항',
            path: '/notice/list',
            icon: 'ni ni-notification-70 text-red',
          }"
        >
        </sidebar-item>

        <sidebar-item
          :link="{
            name: '매물 검색',
            path: '/apts',
            icon: 'ni ni-pin-3 text-orange',
          }"
        >
        </sidebar-item>

        <sidebar-item
          :link="{
            name: 'QnA',
            path: '/board/list',
            icon: 'ni ni-chat-round text-red',
          }"
        >
        </sidebar-item>

        <div v-if="!checkSession()">
          <sidebar-item
            :link="{
              name: 'Login',
              path: '/login',
              icon: 'ni ni-key-25 text-info',
            }"
          >
          </sidebar-item>
          <sidebar-item
            :link="{
              name: 'Register',
              path: '/member/register',
              icon: 'ni ni-circle-08 text-pink',
            }"
          >
          </sidebar-item>
        </div>
        <div v-else>
          <sidebar-item
            :link="{
              name: '마이 페이지',
              path: '/profile',
              icon: 'ni ni-single-02 text-yellow',
            }"
          >
          </sidebar-item>
        </div>
        <div v-if="isAdmin()">
          <hr class="my-3" />
          <h6 class="navbar-heading p-0 text-muted">ADMINISTRATOR</h6>
          <sidebar-item
            :link="{
              name: '관리자 페이지',
              path: '/member/list',
              icon: 'ni ni-ui-04 text-pink',
            }"
          >
          </sidebar-item>
        </div>
        <hr class="my-3" />
        <div>
          <carousel></carousel>
        </div>
      </template>
    </side-bar>
    <div class="main-content">
      <dashboard-navbar :type="$route.meta.navbarType"></dashboard-navbar>

      <div @click="$sidebar.displaySidebar(false)">
        <fade-transition :duration="200" origin="center top" mode="out-in">
          <router-view></router-view>
        </fade-transition>
      </div>
      <content-footer v-if="!$route.meta.hideFooter"></content-footer>
    </div>
  </div>
</template>
<script>
/* eslint-disable no-new */
import PerfectScrollbar from "perfect-scrollbar";
import "perfect-scrollbar/css/perfect-scrollbar.css";

function hasElement(className) {
  return document.getElementsByClassName(className).length > 0;
}

function initScrollbar(className) {
  if (hasElement(className)) {
    new PerfectScrollbar(`.${className}`);
  } else {
    // try to init it later in case this component is loaded async
    setTimeout(() => {
      initScrollbar(className);
    }, 100);
  }
}

import Carousel from "./Carousel";
import DashboardNavbar from "./DashboardNavbar.vue";
import ContentFooter from "./ContentFooter.vue";
import DashboardContent from "./Content.vue";
import { FadeTransition } from "vue2-transitions";

export default {
  components: {
    Carousel,
    DashboardNavbar,
    ContentFooter,
    DashboardContent,
    FadeTransition,
    Carousel,
  },
  methods: {
    isAdmin() {
      if (!this.$session.get("user")) return false;
      if (this.$session.get("user").userid == "admin") return true;
      else return false;
    },
    initScrollbar() {
      let isWindows = navigator.platform.startsWith("Win");
      if (isWindows) {
        initScrollbar("sidenav");
      }
    },
    checkSession() {
      if (this.$session.get("user")) return true;
      else return false;
    },
  },
  mounted() {
    this.initScrollbar();
  },
};
</script>
<style lang="scss"></style>
