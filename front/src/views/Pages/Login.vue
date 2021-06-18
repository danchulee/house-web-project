<template>
  <div>
    <!-- Header -->
    <div class="header bg-gradient-info py-7 py-lg-8 pt-lg-9">
      <b-container>
        <div class="header-body text-center mb-7">
          <b-row class="justify-content-center">
            <b-col xl="5" lg="6" md="8" class="px-5">
              <h1 class="text-white">어서오세요!</h1>
              <p class="text-lead text-white">
                로그인하여 다양한 매물을 확인해보세요.
              </p>
            </b-col>
          </b-row>
        </div>
      </b-container>
      <div class="separator separator-bottom separator-skew zindex-100">
        <svg
          x="0"
          y="0"
          viewBox="0 0 2560 100"
          preserveAspectRatio="none"
          version="1.1"
          xmlns="http://www.w3.org/2000/svg"
        >
          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </div>
    <!-- Page content -->
    <b-container class="mt--8 pb-5">
      <b-row class="justify-content-center">
        <b-col lg="5" md="7">
          <b-card no-body class="bg-secondary border-0 mb-0">
            <b-card-header class="bg-transparent pb-2">
              <!-- <div class="text-muted text-center mt-2 mb-3"><small>Sign in with</small></div>
              <div class="btn-wrapper text-center">
                <a href="#" class="btn btn-neutral btn-icon">
                  <span class="btn-inner--icon"><img src="img/icons/common/github.svg"/></span>
                  <span class="btn-inner--text">Github</span>
                </a>
                <a href="#" class="btn btn-neutral btn-icon">
                  <span class="btn-inner--icon"><img src="img/icons/common/google.svg"/></span>
                  <span class="btn-inner--text">Google</span>
                </a>
              </div> -->
            </b-card-header>
            <b-card-body class="px-lg-5 py-lg-5">
              <div class="text-center text-muted mb-4">
                <small>아이디와 비밀번호를 입력하세요.</small>
              </div>
              <validation-observer v-slot="{ handleSubmit }" ref="formValidator">
                <b-form role="form" @submit.prevent="handleSubmit(onSubmit)">
                  <!-- <base-input
                    alternative
                    class="mb-3"
                    name="Email"
                    :rules="{ required: true, email: true }"
                    prepend-icon="ni ni-email-83"
                    placeholder="Email"
                    v-model="model.email"
                  >
                  </base-input> -->

                  <base-input
                    alternative
                    class="mb-3"
                    name="Id"
                    :rules="{ required: true, min: 4 }"
                    prepend-icon="ni ni-single-02"
                    type="id"
                    placeholder="ID"
                    v-model="model.id"
                  >
                  </base-input>

                  <base-input
                    alternative
                    class="mb-3"
                    name="Password"
                    :rules="{ required: true, min: 4 }"
                    prepend-icon="ni ni-lock-circle-open"
                    type="password"
                    placeholder="Password"
                    v-model="model.password"
                  >
                  </base-input>

                  <b-form-checkbox v-model="model.rememberMe">아이디 저장</b-form-checkbox>
                  <div class="text-center">
                    <base-button type="primary" native-type="submit" class="my-4"
                      >Sign in</base-button
                    >
                  </div>
                </b-form>
              </validation-observer>
            </b-card-body>
          </b-card>
          <b-row class="mt-3">
            <b-col cols="6">
              <router-link to="/dashboard" class="text-light"
                ><small>비밀번호를 잊었나요?</small></router-link
              >
            </b-col>
            <b-col cols="6" class="text-right">
              <router-link to="/member/register" class="text-light"
                ><small>새로 가입하기</small></router-link
              >
            </b-col>
          </b-row>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>
<script>
import axios from 'axios';

export default {
  data() {
    return {
      model: {
        id: '',
        //email: '',
        password: '',
        rememberMe: false,
      },
    };
  },
  methods: {
    onSubmit() {
      axios
        .post('http://localhost/api/member/login', {
          userid: this.model.id,
          userpwd: this.model.password,
        })
        .then(({ data }) => {
          if (data) {
            alert('로그인에 성공하였습니다.');
            this.moveHome();
            this.$session.set('user', data);
            console.log(this.$session.get('user'));
          } else {
            alert('로그인에 실패하였습니다.');
          }
        })
        .catch(() => {
          alert('처리시 에러가 발생했습니다.');
        });
    },
    moveLogin() {
      this.$router.push('/login');
    },
    moveHome() {
      this.$router.push('/');
    },
  },
};
</script>
