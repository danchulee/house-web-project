<template>
  <b-card no-body style="text-align:center;">
    <b-card-header class="border-0" style="text-align:center">
      <h1 class="mb-0">공지사항 등록하기</h1>
      <br />
    </b-card-header>
    <div style="width:60%; margin:auto">
      <create-form type="create" />
    </div>
  </b-card>
</template>

<script>
import CreateForm from "@/components/Notice/Form.vue";
export default {
  name: "create",
  components: {
    CreateForm,
  },
};
</script>

<style></style>
