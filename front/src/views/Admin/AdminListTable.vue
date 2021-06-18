<template>
  <b-card no-body style="text-align:center;">
    <b-card-header class="border-0" style="text-align:center">
      <h1 class="mb-0">관리자 페이지</h1>
      <br />
      <h3 class="mb-0">
        {{
          items.length == 0
            ? '회원정보가 없습니다.'
            : items.length + ' 개의 회원정보가 검색되었습니다.'
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
        <th>ID</th>
        <th>이름</th>
        <th>PW</th>
        <th>e-mail</th>
        <th>가입날짜</th>
      </tr>
      <list-row
        v-for="(item, index) in items"
        :key="`${index}_items`"
        :userid="item.userid"
        :username="item.username"
        :userpwd="item.userpwd"
        :email="item.email"
        :joindate="item.joindate"
      />
    </table>

    <!-- <b-card-footer class="py-4 d-flex justify-content-end">
      <base-pagination v-model="currentPage" :per-page="10" :total="50"></base-pagination>
    </b-card-footer> -->
  </b-card>
</template>

<script>
import http from '@/util/http-common';
import ListRow from '@/components/Admin/Row.vue';
import { Table, TableColumn } from 'element-ui';
export default {
  name: 'admin-list-table',
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
      .get('/member/list')
      .then(({ data }) => {
        this.items = data;
      })
      .catch(() => {
        alert('에러가 발생했습니다.');
      });
  },
  methods: {
    boardDetail() {
      this.$router.push(`/admin/read?no=${row.no}`);
    },
  },
};
</script>

<style>
.board-create-btn {
  margin-right: auto;
}
</style>
