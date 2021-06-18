<template lang="">
  <div>
    <GChart
      style="height:300px;"
      v-cloak
      type="ColumnChart"
      :data="chartData"
      :options="chartOptions"
    />
  </div>
</template>
<script>
import axios from "axios";
import { GChart } from "vue-google-charts";

export default {
  components: {
    GChart,
  },
  data() {
    return {
      chartDataHeader: ["Year", "신규확진자", "전일대비(해외유입)", "전일대비(지역발생)", "사망"],
      chartDataRows: [
        ["합계", 0, 0, 0, 0],
        ["서울", 0, 0, 0, 0],
        ["인천", 0, 0, 0, 0],
        ["경기", 0, 0, 0, 0],
      ],
      updatedChartData: [],
      coronaNum: {},
      서울: {},
      인천: {},
      경기: {},
      누적: {},
      chartOptions: {
        chart: {
          title: "수도권 코로나 현황",
          subtitle: new Date(),
        },
      },
    };
  },
  computed: {
    chartData() {
      return [this.chartDataHeader, ...this.updatedChartData];
    },
  },
  methods: {
    updateData() {
      axios
        .get(
          "https://api.corona-19.kr/korea/country/new/?serviceKey=fFL91A6Sw34KeNRtzsXTuvdJMU8CBqHgi"
        )
        .then((response) => {
          this.coronaNum = response.data;
          this.서울 = this.coronaNum.seoul;
          this.인천 = this.coronaNum.incheon;
          this.경기 = this.coronaNum.gyeonggi;
          this.chartDataRows[1][1] = Number(this.서울.newCase);
          this.chartDataRows[1][2] = Number(this.서울.newFcase);
          this.chartDataRows[1][3] = Number(this.서울.newCcase);
          this.chartDataRows[1][4] = Number(this.서울.death);
          this.chartDataRows[2][1] = Number(this.인천.newCase);
          this.chartDataRows[2][2] = Number(this.인천.newFcase);
          this.chartDataRows[2][3] = Number(this.인천.newCcase);
          this.chartDataRows[2][4] = Number(this.인천.death);
          this.chartDataRows[3][1] = Number(this.경기.newCase);
          this.chartDataRows[3][2] = Number(this.경기.newFcase);
          this.chartDataRows[3][3] = Number(this.경기.newCcase);
          this.chartDataRows[3][4] = Number(this.경기.death);
          for (let i = 1; i <= 4; i++) {
            this.chartDataRows[0][i] = 0;
            for (let j = 1; j < 4; j++) {
              this.chartDataRows[0][i] += this.chartDataRows[j][i];
            }
          }
          this.updatedChartData = this.chartDataRows;
        })
        .catch((error) => console.error(error));
    },
  },
  created() {
    this.updateData();
  },
};
</script>
<style lang=""></style>
