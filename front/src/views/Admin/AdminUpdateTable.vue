<template>
  <b-card no-body style="text-align:center;">
    <b-card-header class="border-0" style="text-align:center">
      <h1 class="mb-0">회원정보 수정하기</h1>
      <h3>ID : {{ this.$route.query.userid }}</h3>
      <br />
    </b-card-header>
    <div style="width:60%; margin:auto">
      <update-form type="update" />
    </div>
  </b-card>
</template>

<script>
import UpdateForm from "@/components/Admin/Form.vue";
export default {
  name: "update",
  components: {
    UpdateForm,
  },
};
</script>

<style></style>
