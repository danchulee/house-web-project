<template>
  <div>
    <!-- <b-button id="show-btn" @click="showModal">Open Modal</b-button>
    <b-button id="toggle-btn" @click="toggleModal">Toggle Modal</b-button> -->

    <b-modal ref="my-modal" size="xl" hide-footer title="매물 상세조회">
      <h1 class="ml-3">{{ apt.aptName }}</h1>
      <div class="d-block text-center"></div>
      <b-container class="bv-example-row">
        <b-row>
          <b-col id="myimg" cols="12" md="7">
            <b-img :src="this.img" fluid thumbnail rounded></b-img>
          </b-col>
          <b-col cols="12" md="4">
            <b-table-simple hover small caption-top stacked>
              <caption>
                기재된 정보는 다음과 같습니다.
              </caption>
              <b-tbody>
                <b-tr>
                  <b-th class="text-center" variant="info">매물번호</b-th>
                  <b-th>{{ apt.no }}</b-th>
                </b-tr>
                <b-tr>
                  <b-th class="text-center" variant="info">매물 명</b-th>
                  <b-th>{{ apt.aptName }}</b-th>
                </b-tr>
                <b-tr>
                  <b-th class="text-center" variant="info">전용면적</b-th>
                  <b-th>{{ (apt.area / 3.305785).toFixed(2) }}평</b-th>
                  <b-th>{{ apt.area }}m² </b-th>
                </b-tr>
                <b-tr>
                  <b-th class="text-center" variant="info">거래금액</b-th>
                  <b-th>{{ apt.dealAmount }}</b-th>
                </b-tr>
                <b-tr>
                  <b-th class="text-center" variant="info">거래일</b-th>
                  <b-th>{{ apt.dealYear }}.{{ apt.dealMonth }}.{{ apt.dealDay }}</b-th>
                </b-tr>
                <b-tr>
                  <b-th class="text-center" variant="info">건축년도</b-th>
                  <b-th>{{ apt.buildYear }}</b-th>
                </b-tr>
                <b-tr>
                  <b-th class="text-center" variant="info">지번</b-th>
                  <b-th>{{ apt.jibun }}</b-th>
                </b-tr>
                <b-tr>
                  <b-th class="text-center" variant="info">층</b-th>
                  <b-th>{{ apt.floor }}</b-th>
                </b-tr>
              </b-tbody>
              <b-tfoot>
                <b-tr>
                  <b-td colspan="7" variant="secondary" class="text-right">
                    Total Rows: <b>8</b>
                  </b-td>
                </b-tr>
              </b-tfoot>
            </b-table-simple>
          </b-col>
        </b-row>
        <!-- <b-row>
          <b-col cols="6" md="4">cols="6" md="4"</b-col>
          <b-col cols="6" md="4">cols="6" md="4"</b-col>
          <b-col cols="6" md="4">cols="6" md="4"</b-col>
        </b-row>
        <b-row>
          <b-col cols="6">cols="6"</b-col>
          <b-col cols="6">cols="6"</b-col>
        </b-row> -->
      </b-container>

      <b-button class="mt-2" variant="outline-warning" block @click="likeModal">좋아요</b-button>
      <b-button class="mt-3" variant="outline-danger" block @click="hideModal">Close Me</b-button>
    </b-modal>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data() {
    return {
      apt: Object,
      img: '',
      user: this.$session.get('user'),
    };
  },
  props: {
    index: Number,
    list: Array,
    openmodal: Boolean,
  },
  methods: {
    showModal() {
      this.$refs['my-modal'].show();
      this.img = 'img/apt/apt' + Math.floor(Math.random() * 6 + 1) + '.jpg';
      // console.log(this.img);
    },
    hideModal() {
      this.$refs['my-modal'].hide();
    },
    likeModal() {
      axios
        .post(`http://localhost:80/api/member/like/${this.user.userid}/${this.apt.no}`)
        .then(({ data }) => {
          let msg = '좋아요 처리시 문제가 발생했습니다.';
          if (data === 'success') {
            msg = '좋아요를 눌렀습니다.';
          }
          alert(msg);
        })
        .catch(() => {
          alert('좋아요 처리시 에러가 발생했습니다.');
        });
    },
  },
  watch: {
    openmodal: function() {
      this.showModal();
      console.log(this.$props.list[this.$props.index]);
      this.apt = this.$props.list[this.$props.index];
      console.log(this.apt);
    },
  },
};
</script>
