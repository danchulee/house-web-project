<template>
  <div>
    <!-- Header -->
    <div class="header bg-gradient-info py-7 py-lg-8 pt-lg-9">
      <b-container class="container">
        <div class="header-body text-center mb-3">
          <b-row class="justify-content-center">
            <b-col xl="5" lg="6" md="8" class="px-5">
              <h1 class="text-white">새로 가입하세요</h1>
              <p class="text-lead text-white">
                가입하여 다양한 정보를 확인하세요!
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
      <!-- Table -->
      <b-row class="justify-content-center">
        <b-col lg="6" md="8">
          <b-card no-body class="bg-secondary border-0">
            <b-card-header class="bg-transparent pb-2">
              <!-- <div class="text-muted text-center mt-2 mb-4"><small>Sign up with</small></div>
              <div class="text-center">
                <a href="#" class="btn btn-neutral btn-icon mr-4">
                  <span class="btn-inner--icon"><img src="img/icons/common/github.svg"></span>
                  <span class="btn-inner--text">Github</span>
                </a>
                <a href="#" class="btn btn-neutral btn-icon">
                  <span class="btn-inner--icon"><img src="img/icons/common/google.svg"></span>
                  <span class="btn-inner--text">Google</span>
                </a>
              </div> -->
            </b-card-header>
            <b-card-body class="px-lg-5 py-lg-5">
              <div class="text-center text-muted mb-4">
                <small>아이디, 이름, 이메일, 비밀번호를 입력하세요.</small>
              </div>
              <validation-observer v-slot="{ handleSubmit }" ref="formValidator">
                <b-form role="form" @submit.prevent="handleSubmit(onSubmit)">
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
                    prepend-icon="ni ni-hat-3"
                    placeholder="Name"
                    name="Name"
                    :rules="{ required: true }"
                    v-model="model.name"
                  >
                  </base-input>

                  <base-input
                    alternative
                    class="mb-3"
                    prepend-icon="ni ni-email-83"
                    placeholder="Email"
                    name="Email"
                    :rules="{ required: true, email: true }"
                    v-model="model.email"
                  >
                  </base-input>

                  <base-input
                    alternative
                    class="mb-3"
                    prepend-icon="ni ni-lock-circle-open"
                    placeholder="password"
                    type="password"
                    name="Password"
                    :rules="{ required: true, min: 4 }"
                    v-model="model.password"
                  >
                  </base-input>
                  <div class="text-muted font-italic">
                    <small
                      >password strength:
                      <span class="text-success font-weight-700">strong</span></small
                    >
                  </div>
                  <b-row class=" my-4">
                    <b-col cols="12">
                      <base-input
                        :rules="{ required: { allowFalse: false } }"
                        name="Privacy"
                        Policy
                      >
                        <b-form-checkbox v-model="model.agree">
                          <span class="text-muted"
                            ><a href="#!">개인 정보 제공</a>에 동의합니다.</span
                          >
                        </b-form-checkbox>
                      </base-input>
                    </b-col>
                  </b-row>
                  <div class="text-center">
                    <b-button type="submit" variant="primary" class="mt-4">Create account</b-button>
                  </div>
                </b-form>
              </validation-observer>
            </b-card-body>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import http from '@/util/http-common';
export default {
  name: 'register',
  data() {
    return {
      model: {
        id: '',
        name: '',
        email: '',
        password: '',
        agree: false,
      },
    };
  },
  methods: {
    onSubmit() {
      // this will be called only after form is valid. You can do an api call here to register users
      http
        .post('/member/register', {
          userid: this.model.id,
          userpwd: this.model.password,
          username: this.model.name,
          email: this.model.email,
          joindate: '',
        })
        .then(({ data }) => {
          let msg = '가입 처리시 문제가 발생했습니다.';
          if (data === 'success') {
            msg = '가입이 완료되었습니다.';
          }
          alert(msg);
          this.moveLogin();
        })
        .catch(() => {
          alert('가입 처리시 에러가 발생했습니다.');
          this.moveHome();
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

<style></style>
