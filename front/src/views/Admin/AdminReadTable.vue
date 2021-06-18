<template>
  <b-card no-body style="text-align:center;">
    <b-card-header class="border-0" style="text-align:center">
      <h1 class="mb-0">{{ item.username }}님의 회원정보</h1>
      <br />
    </b-card-header>

    <div>
      <detail
        :userid="item.userid"
        :username="item.username"
        :userpwd="item.userpwd"
        :email="item.email"
        :joindate="item.joindate"
      />
    </div>
  </b-card>
</template>

<script>
import http from "@/util/http-common";
import Detail from "@/components/Admin/Detail.vue";
export default {
  name: "admin-read-table",
  components: {
    Detail,
  },
  data: function() {
    return {
      item: {},
    };
  },
  created() {
    http.get(`/member/${this.$route.query.userid}`).then(({ data }) => {
      this.item = data;
      console.dir(data);
    });
  },
};
</script>

<style></style>
