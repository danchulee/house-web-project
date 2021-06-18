<template>
  <b-card no-body style="text-align:center;">
    <b-card-header class="border-0" style="text-align:center">
      <h1 class="mb-0">Q&A</h1>
      <br />
      <h3 class="mb-0">
        {{
          items.length == 0 ? "Q&A 목록이 없습니다." : items.length + " 개의 Q&A가 검색되었습니다."
        }}
      </h3>
    </b-card-header>

    <table
      class="table-responsive table"
      header-row-class-name="thead-light"
      style="width: 90%; margin:auto;"
    >
      <colgroup>
        <col :style="{ width: '5%' }" />
        <col :style="{ width: '50%' }" />
        <col :style="{ width: '10%' }" />
        <col :style="{ width: '25%' }" />
      </colgroup>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>날짜</th>
      </tr>
      <list-row
        v-for="(item, index) in items"
        :key="`${index}_items`"
        :no="item.no"
        :title="item.title"
        :writer="item.writer"
        :regtime="item.regtime"
      />
    </table>

    <b-card-footer class="py-4 d-flex justify-content-end">
      <span class="board-create-btn"
        ><button class="btn btn-primary" @click="boardCreate">게시글 등록</button></span
      >
      <!-- <base-pagination v-model="currentPage" :per-page="10" :total="50"></base-pagination> -->
    </b-card-footer>
  </b-card>
</template>

<script>
import http from "@/util/http-common";
import ListRow from "@/components/Board/Row.vue";
import { Table, TableColumn } from "element-ui";
export default {
  name: "board-list-table",
  components: {
    [Table.name]: Table,
    [TableColumn.name]: TableColumn,
    ListRow,
  },
  data() {
    return {
      items: [],
      currentPage: 1,
    };
  },
  created() {
    http
      .get("/board")
      .then(({ data }) => {
        this.items = data;
      })
      .catch(() => {
        alert("에러가 발생했습니다.");
      });
  },
  methods: {
    boardCreate() {
      this.$router.push("/board/create");
    },
    boardDetail() {
      this.$router.push(`/board/read?no=${row.no}`);
    },
  },
};
</script>

<style>
.board-create-btn {
  margin-right: auto;
}
</style>
