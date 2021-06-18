<template>
  <div>
    <base-header class="pb-6 pb-8 pt-5 pt-md-8 bg-gradient-warning">
      <div>
        <b-form-select
          v-model="구"
          :options="구옵션"
          style="width: 40%"
          class="mr-3"
        ></b-form-select>
        <b-form-select v-model="동" :options="동옵션" style="width: 40%"></b-form-select>
        <a @click="updateAreaList" class="btn btn-info" style="float:right">지역으로 검색하기</a>
      </div>
      <div></div>
      <div class="mt-3 mb-3">
        <h3>
          선택 지역: <strong>{{ 구 }} {{ 동 }}</strong>
        </h3>
      </div>
      <b-form-input
        placeholder="ex. 싸피빌라"
        v-model="건물명"
        style="width: 81%; display: inline-block"
      >
      </b-form-input>
      <a @click="updateNameList" class="btn btn-info" style="float:right">이름으로 검색하기</a>
    </base-header>
    <br />
    <google-maps :lat="lat" :lng="lng" :change="change" :동="동" :구="구"></google-maps>
    <b-container fluid class="mt--7">
      <b-row>
        <b-col>
          <light-table :list="list" :dong="동" :gu="구" :dptname="건물명" />
        </b-col>
      </b-row>
    </b-container>
    <!-- <b-card-footer class="py-4 d-flex justify-content-end">
      <base-pagination v-model="currentPage" :per-page="10" :total="50"></base-pagination>
    </b-card-footer> -->
  </div>
</template>
<script>
import axios from 'axios';
import { Dropdown, DropdownItem, DropdownMenu, Table, TableColumn } from 'element-ui';
import areas from './Maps/areas';
import LightTable from './Tables/RegularTables/LightTable';
import GoogleMaps from './Maps/GoogleMaps';

export default {
  name: 'AptList',
  components: {
    LightTable,
    GoogleMaps,
    [Dropdown.name]: Dropdown,
    [DropdownItem.name]: DropdownItem,
    [DropdownMenu.name]: DropdownMenu,
    [Table.name]: Table,
    [TableColumn.name]: TableColumn,
  },
  data() {
    return {
      change: false,
      areas,
      구옵션: [
        '종로구',
        '중구',
        '용산구',
        '성동구',
        '광진구',
        '동대문구',
        '중랑구',
        '성북구',
        '강북구',
        '도봉구',
        '노원구',
        '은평구',
        '서대문구',
        '마포구',
        '양천구',
        '강서구',
        '구로구',
        '금천구',
        '영등포구',
        '동작구',
        '관악구',
        '서초구',
        '강남구',
        '송파구',
        '강동구',
      ],
      //동옵션: [],
      구: '강남구',
      동: '역삼동',
      건물명: null,
      lat: '37.50166',
      lng: '127.03985',
      //apts: [],
      list: [],
      session: this.$session.get('user'),
    };
  },
  watch: {
    구: function() {
      this.동 = null;
    },
  },
  computed: {
    동옵션: function() {
      for (let index = 0; index < areas.length; index++) {
        const element = areas[index];
        if (element.구 === this.구) {
          return element.동;
        }
      }
    },
  },
  beforeMount() {
    console.log(this.session);
    if (!this.session) {
      alert('로그인 후 사용가능한 기능입니다.');
      this.$router.push('/');
    }
  },
  methods: {
    updateAreaList() {
      alert('지역으로 검색');
      this.건물명 = null;
      axios
        .get(`http://localhost:80/api/house/searchdong/${this.구}/${this.동}`)
        .then(({ data }) => {
          this.list = data;
        })
        .catch(() => {
          alert('오류가 발생했습니다.');
        });
      axios
        .get(`http://localhost:80/api/house/searcharea/${this.구}/${this.동}`)
        .then(({ data }) => {
          console.log(data);
          this.lat = data.lat;
          this.lng = data.lng;
          //console.log(this.lat);
          //console.log(this.lng);
        })
        .catch(() => {
          alert('오류가 발생했습니다.');
        });
      if (this.list == '') this.list = [];
      this.change = !this.change;
    },
    updateNameList() {
      alert('건물명으로 검색');
      this.구 = null;
      this.동 = null;
      axios
        .get(`http://localhost:80/api/house/searchapt/${this.건물명}`)
        .then(({ data }) => {
          this.list = data;
        })
        .catch(() => {
          alert('오류가 발생했습니다.');
        });
    },
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
