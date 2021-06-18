<template>
  <card>
    <b-row align-v="center" slot="header">
      <b-col cols="8">
        <h3 class="mb-0">개인정보 수정</h3>
      </b-col>
      <!-- <b-col cols="4" class="text-right">
        <a href="#!" class="btn btn-sm btn-primary">Settings</a>
      </b-col> -->
    </b-row>

    <b-form @submit.prevent="updateProfile">
      <h6 class="heading-small text-muted mb-4">User information</h6>

      <div class="pl-lg-4">
        <b-row>
          <b-col lg="6">
            <base-input
              type="text"
              label="UserID"
              placeholder="UserID"
              v-model="user.userid"
              readonly
            >
            </base-input>
          </b-col>
          <b-col lg="6">
            <base-input
              type="email"
              label="Email address"
              placeholder="mike@email.com"
              v-model="user.email"
            >
            </base-input>
          </b-col>
        </b-row>
        <b-row>
          <b-col lg="6">
            <base-input type="text" label="Name" placeholder="First Name" v-model="user.username">
            </base-input>
          </b-col>
          <b-col lg="6">
            <base-input type="text" label="Password" placeholder="Password" v-model="user.userpwd">
            </base-input>
          </b-col>
        </b-row>
      </div>

      <hr class="my-4" />
      <!-- Description -->
      <h6 class="heading-small text-muted mb-4">About me</h6>
      <div class="pl-lg-4">
        <b-form-group
          label="내가 좋아하는 매물 목록"
          label-class="form-control-label"
          class="mb-0"
          label-for="about-form-textaria"
        >
          <light-table :list="this.likes" :dong="null" :gu="null" :dptname="null" />
        </b-form-group>
      </div>
      <div style="float: right;">
        <a @click="updateProfile" class="btn btn-info mt-3">수정하기</a>
        <a @click="expireProfile" class="btn btn-info mt-3 ml-2">탈퇴하기</a>
      </div>
    </b-form>
  </card>
</template>
<script>
import axios from "axios";
import LightTable from "../../Tables/RegularTables/LightTable";

export default {
  props: {
    likes: Array,
  },
  components: {
    LightTable,
  },
  data() {
    return {
      user: this.$session.get("user"),
      // likes: [],
    };
  },

  methods: {
    updateProfile() {
      // alert('Your data: ' + JSON.stringify(this.user));
      axios
        .put("http://localhost/api/member/update", {
          userid: this.user.userid,
          username: this.user.username,
          userpwd: this.user.userpwd,
          email: this.user.email,
          joindate: this.user.joindate,
        })
        .then(({ data }) => {
          let msg = "수정 중 문제가 발생하였습니다.";
          if (data === "success") {
            msg = "수정이 완료되었습니다.";
            this.$session.set("user", {
              userid: this.user.userid,
              username: this.user.username,
              userpwd: this.user.userpwd,
              email: this.user.email,
              joindate: this.user.joindate,
            });
          }
          alert(msg);
          this.$router.go();
        })
        .catch(() => {
          alert("수정 처리시 에러가 발생했습니다.");
        });
    },
    expireProfile() {
      axios
        .delete(`http://localhost/api/member/delete/${this.user.userid}`)
        .then(({ data }) => {
          let msg = "탈퇴 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "탈퇴가 완료되었습니다.";
            this.$session.destroy();
          }
          alert(msg);
          this.$router.push("/");
        })
        .catch(() => {
          alert("탈퇴 처리시 에러가 발생했습니다.");
        });
    },
  },
};
</script>
<style></style>
