<template>
  <b-card no-body style="text-align:center;">
    <b-card-header class="border-0" style="text-align:center">
      <h1 class="mb-0">{{ this.$route.query.no }}번 공지사항 상세보기</h1>
      <br />
    </b-card-header>

    <div>
      <detail
        :content="item.content"
        :title="item.title"
        :writer="item.writer"
        :regtime="item.regtime"
        :no="item.no"
      />
    </div>
  </b-card>
</template>

<script>
import http from "@/util/http-common";
import Detail from "@/components/Notice/Detail.vue";
export default {
  name: "notice-read-table",
  components: {
    Detail,
  },
  data: function() {
    return {
      item: {},
    };
  },
  created() {
    http.get(`/notice/${this.$route.query.no}`).then(({ data }) => {
      this.item = data;
      console.dir(data);
    });
  },
};
</script>

<style></style>
