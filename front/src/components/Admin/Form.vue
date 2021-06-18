<template>
  <div>
    <div class="form-group">
      <label for="userid">이름</label>
      <input
        type="text"
        class="form-control"
        id="userid"
        ref="userid"
        placeholder="이름을 입력하세요"
        v-model="username"
      />
    </div>
    <div class="form-group">
      <label for="userpwd">비밀번호</label>
      <input
        type="text"
        class="form-control"
        id="userpwd"
        ref="userpwd"
        placeholder="비밀번호를 입력하세요"
        v-model="userpwd"
      />
    </div>
    <div class="form-group">
      <label for="email">e-mail</label>
      <textarea
        type="text"
        class="form-control"
        id="email"
        ref="email"
        placeholder="email을 입력하세요"
        v-model="email"
      ></textarea>
    </div>
    <div class="text-center">
      <button class="btn btn-primary" v-if="type == 'create'" @click="checkHandler">
        등록
      </button>
      <button class="btn btn-primary" v-else @click="checkHandler">수정</button>
      <button class="btn btn-primary" @click="moveList">목록</button>
    </div>
    <br />
  </div>
</template>

<script>
import http from "@/util/http-common";
export default {
  name: "admin-Form",
  props: {
    type: { type: String },
  },
  data: function() {
    return {
      userid: "",
      username: "",
      userpwd: "",
      email: "",
      joindate: "",
    };
  },
  methods: {
    checkHandler() {
      let err = true;
      let msg = "";
      !this.userid && ((msg = "이름을 입력해주세요"), (err = false), this.$refs.userid.focus());
      err &&
        !this.userpwd &&
        ((msg = "비밀번호를 입력해주세요"), (err = false), this.$refs.userpwd.focus());
      err &&
        !this.email &&
        ((msg = "email을 입력해주세요"), (err = false), this.$refs.email.focus());

      if (!err) alert(msg);
      else this.type == "create" ? this.createHandler() : this.updateHandler();
    },
    createHandler() {
      http
        .post("/member", {
          writer: this.writer,
          title: this.title,
          content: this.content,
        })
        .then(({ data }) => {
          let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "등록이 완료되었습니다.";
          }
          alert(msg);
          this.moveList();
        })
        .catch(() => {
          alert("등록 처리시 에러가 발생했습니다.");
        });
    },
    updateHandler() {
      http
        .put(`/member/update/${this.userid}`, {
          userid: this.userid,
          username: this.username,
          userpwd: this.userpwd,
          email: this.email,
          joindate: this.joindate,
        })
        .then(({ data }) => {
          let msg = "수정 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "수정이 완료되었습니다.";
          }
          alert(msg);
          this.moveList();
        })
        .catch(() => {
          alert("수정 처리시 에러가 발생했습니다.");
        });
    },
    moveList() {
      this.$router.push("/member/list");
    },
  },
  created() {
    if (this.type === "update") {
      http
        .get(`/member/${this.$route.query.userid}`)
        .then(({ data }) => {
          this.userid = data.userid;
          this.username = data.username;
          this.userpwd = data.userpwd;
          this.email = data.email;
          this.joindate = data.joindate;
        })
        .catch(() => {
          alert("에러가 발생했습니다.");
        });
    }
  },
};
</script>

<style scoped></style>
