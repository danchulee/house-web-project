<template>
  <div>
    <base-header class="pb-6 pb-8 pt-5 pt-md-8 bg-gradient-success"> </base-header>
    <b-container fluid class="mt--7">
      <b-row>
        <b-col>
          <notice-list-table />
        </b-col>
      </b-row>
      <div class="mt-5"></div>
    </b-container>
  </div>
</template>
<script>
import { Dropdown, DropdownItem, DropdownMenu, Table, TableColumn } from "element-ui";
import NoticeListTable from "@/views/Notice/NoticeListTable.vue";

export default {
  components: {
    NoticeListTable,
    [Dropdown.name]: Dropdown,
    [DropdownItem.name]: DropdownItem,
    [DropdownMenu.name]: DropdownMenu,
    [Table.name]: Table,
    [TableColumn.name]: TableColumn,
  },
  data() {
    return {
      session: this.$session.get("user"),
    };
  },
  beforeMount() {
    console.log(this.session);
    if (!this.session) {
      alert("로그인 후 사용가능한 기능입니다.");
      this.$router.push("/");
    }
  },
};
</script>
<style>
.el-table.table-dark {
  background-color: #172b4d;
  color: #f8f9fe;
}

.el-table.table-dark th,
.el-table.table-dark tr {
  background-color: #172b4d;
}

.el-table.table-dark td,
.el-table.table-dark th.is-leaf {
  border-bottom: none;
}
</style>
