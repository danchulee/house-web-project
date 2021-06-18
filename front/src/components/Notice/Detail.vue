<template>
  <div>
    <table class="table table-bordered">
      <tr>
        <th>번호</th>
        <td>{{ no }}</td>
      </tr>
      <tr>
        <th>작성자</th>
        <td>{{ writer }}</td>
      </tr>
      <tr>
        <th>제목</th>
        <td>{{ title }}</td>
      </tr>
      <tr>
        <th>날짜</th>
        <td>{{ getFormatDate(regtime) }}</td>
      </tr>
      <tr>
        <td colspan="2">
          {{ content }}
        </td>
      </tr>
    </table>

    <br />
    <div class="text-center">
      <router-link to="/notice/list"><button class="btn btn-primary">목록</button></router-link>
      &nbsp;
      <router-link v-if="checkAdmin()" :to="'/notice/update?no=' + no"
        ><button class="btn btn-primary">수정</button></router-link
      >
      &nbsp;
      <router-link v-if="checkAdmin()" :to="'/notice/delete?no=' + no"
        ><button class="btn btn-primary">삭제</button></router-link
      >
    </div>
    <br />
  </div>
</template>

<script>
import moment from "moment";
export default {
  name: "detail",
  props: {
    no: { type: Number },
    writer: { type: String },
    title: { type: String },
    content: { type: String },
    regtime: { type: String },
  },
  methods: {
    checkAdmin() {
      if (this.$session.get("user").username == "관리자") return true;
      else return false;
    },
    getFormatDate(regtime) {
      return moment(new Date(regtime)).format("YYYY.MM.DD HH:mm:ss");
    },
  },
};
</script>
