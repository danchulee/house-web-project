<template>
  <b-card no-body style="text-align:center;">
    <b-card-header class="border-0" style="text-align:center">
      <h1 class="mb-0">{{ this.$route.query.no }}번 공지사항 삭제중...</h1>
      <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    </b-card-header>
    <div style="width:60%; margin:auto">
      <create-form type="create" />
    </div>
  </b-card>
</template>

<script>
import http from "@/util/http-common";
export default {
  name: "delete",
  created() {
    http
      .delete(`/notice/delete/${this.$route.query.no}`)
      .then(({ data }) => {
        let msg = "삭제 처리시 문제가 발생했습니다.";
        if (data === "success") {
          msg = "삭제가 완료되었습니다.";
        }
        alert(msg);
        this.$router.push("/notice/list");
      })
      .catch(() => {
        alert("삭제 처리시 에러가 발생했습니다.");
      });
  },
};
</script>

<style></style>
