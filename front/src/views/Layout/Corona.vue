<template>
  <div>
    <b-card no-body style="text-align:center;">
      <table
        class="table-responsive table"
        header-row-class-name="thead-light"
        style="width: 90%; margin:auto;"
      >
        <colgroup>
          <col :style="{ width: '10%' }" />
          <col :style="{ width: '10%' }" />
          <col :style="{ width: '10%' }" />
          <col :style="{ width: '10%' }" />
          <col :style="{ width: '10%' }" />
        </colgroup>
        <tr>
          <th>지역</th>
          <th>신규확진자</th>
          <th>누적확진자</th>
          <th>격리해제</th>
          <th>사망</th>
        </tr>
        <list-row
          v-for="(item, index) in coronaNum"
          :key="`${index}_items`"
          :countryName="item.countryName"
          :newCase="item.newCase"
          :totalCase="item.totalCase"
          :recovered="item.recovered"
          :death="item.death"
        />
      </table>
    </b-card>
  </div>
</template>
<script>
import axios from "axios";
import ListRow from "@/components/Corona/Row";

export default {
  name: "corona-num",
  components: {
    ListRow,
  },
  data() {
    return {
      coronaNum: [],
    };
  },
  created() {
    axios
      .get(
        "https://api.corona-19.kr/korea/country/new/?serviceKey=fFL91A6Sw34KeNRtzsXTuvdJMU8CBqHgi"
      )
      .then((response) => {
        this.coronaNum = response.data;
      })
      .catch((error) => console.error(error));
  },
  methods: {},
};
</script>
