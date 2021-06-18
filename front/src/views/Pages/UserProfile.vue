<template>
  <div>
    <div
      class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center profile-header"
      style="min-height: 600px; background-image: url(img/theme/profile-cover.jpg); background-size: cover; background-position: center top;"
    >
      <b-container fluid>
        <!-- Mask -->
        <span class="mask bg-gradient-warning opacity-8"></span>
        <!-- Header container -->
        <b-container fluid class="d-flex align-items-center">
          <b-row>
            <b-col lg="7" md="10">
              <h1 class="display-2 text-white">{{ user.username }}님 안녕하세요!</h1>
              <p class="text-white mt-0 mb-5">
                You can edit your personal information nicely on this page. Modify your ID, E-mail,
                and name. <br />개인정보를 수정해보세요.
              </p>
              <a @click="moveHome" class="btn btn-info">홈으로</a>
              <a @click="userLogout" class="btn btn-info">로그아웃하기</a>
            </b-col>
          </b-row>
        </b-container>
      </b-container>
    </div>

    <b-container fluid class="mt--6">
      <b-row>
        <b-col xl="4" class="order-xl-2 mb-5">
          <user-card :likes="this.likes.length"></user-card>
        </b-col>
        <b-col xl="8" class="order-xl-1">
          <edit-profile-form :likes="this.likes"></edit-profile-form>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>
<script>
import axios from 'axios';

import EditProfileForm from './UserProfile/EditProfileForm.vue';
import UserCard from './UserProfile/UserCard.vue';

export default {
  data() {
    return {
      likes: [],
    };
  },
  components: {
    EditProfileForm,
    UserCard,
  },
  methods: {
    moveHome() {
      this.$router.push('/');
    },
    userLogout() {
      this.$session.destroy();
      this.$cookies.keys().forEach((cookie) => this.$cookies.remove(cookie));

      alert('logout');
      this.$router.push('/');
    },
  },
  computed: {
    user: function() {
      return this.$session.get('user');
    },
  },
  beforeMount() {
    axios
      .get(`http://localhost:80/api/member/likelist/${this.user.userid}`)
      .then(({ data }) => {
        this.likes = data;
        // alert('제대로 읽어옴!');
      })
      .catch(() => {
        alert('오류가 발생했습니다.');
      });

    // for (let index = 0; index < this.likes.length; index++) {
    //   const element = this.likes[index];
    //   console.log(element);
    // }
  },
};
</script>
<style></style>
