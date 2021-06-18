<template>
  <b-card no-body>
    <b-card-header class="border-0">
      <h1>
        <div v-if="dptname">
          {{ dptname }}
        </div>
        <div v-else>{{ gu }} {{ dong }}</div>
      </h1>
      <h3 class="mb-0">
        {{ size == 0 ? '검색된 건이 없습니다.' : size + ' 건이 검색되었습니다.' }}
      </h3>
    </b-card-header>

    <el-table
      class="table-responsive table"
      header-row-class-name="thead-light"
      :data="$props.list"
    >
      <el-table-column label="아파트명" prop="aptName" min-width="200px"></el-table-column>
      <el-table-column label="전용면적" prop="area" min-width="100px"> </el-table-column>
      <el-table-column label="거래년도" prop="dealYear" min-width="100px"> </el-table-column>
      <el-table-column label="층수" prop="floor" min-width="80px"> </el-table-column>
      <el-table-column label="가격" prop="dealAmount" min-width="120px"> </el-table-column>
      <el-table-column label="상세조회" min-width="140px">
        <template scope="scope">
          <b-button id="show-btn" @click="showModal(scope.$index)">조회 </b-button>
        </template></el-table-column
      >
    </el-table>
    <div>
      <apt-modal :list="list" :index="index" :openmodal="openmodal"></apt-modal>
    </div>
  </b-card>
</template>
<script>
import { Table, TableColumn } from 'element-ui';
import AptModal from '../../Layout/AptModal';
export default {
  name: 'light-table',
  props: {
    dong: String,
    gu: String,
    dptname: String,
    list: Array,
  },
  components: {
    AptModal,
    [Table.name]: Table,
    [TableColumn.name]: TableColumn,
  },
  data() {
    return {
      index: null,
      no: null,
      aptName: null,
      area: null,
      buildYear: null,
      dealYear: null,
      dealMonth: null,
      dealDay: null,
      jibun: null,
      floor: null,
      dealAmount: null,
      openmodal: true,
    };
  },
  computed: {
    size: function() {
      return !this.list.length ? 0 : this.list.length;
    },
  },
  methods: {
    showModal(index) {
      this.index = index;
      this.openmodal = !this.openmodal;
      //this.$refs['my-modal'].show();
      console.log(index);
    },
    hideModal() {
      this.$refs['my-modal'].hide();
    },
    toggleModal() {
      // We pass the ID of the button that we want to return focus to
      // when the modal has hidden
      this.$refs['my-modal'].toggle('#toggle-btn');
    },
  },
};
</script>
<style>
/* tr.el-table__row {
  cursor: pointer;
} */
</style>
