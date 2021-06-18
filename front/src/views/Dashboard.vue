<template>
  <div>
    <div
      class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center profile-header"
      style="min-height: 500px; background-image: url(img/house.jpg); background-size: cover; background-position: center top;"
    ></div>
    <base-header>
      <!-- <corona></corona> -->
      <!-- <chart></chart> -->
    </base-header>
    <b-container fluid class="mt--7">
      <br /><br /><br /><br /><br /><br />
      <news></news>
      <b-card-header class="border-1" style="text-align:center">
        <h3 class="mb-0">수도권 코로나19 현황</h3>
        <h4>
          <strong>{{ new Date() }} </strong>기준
        </h4>
      </b-card-header>
      <chart></chart>
      <corona></corona>

      <div class="mt-5"></div>
    </b-container>
  </div>
</template>
<script>
import Weather from '@/components/Weather/Weather';
import Chart from './Layout/Chart';

// Charts
import * as chartConfigs from '@/components/Charts/config';
import LineChart from '@/components/Charts/LineChart';
import BarChart from '@/components/Charts/BarChart';

// Components
import BaseProgress from '@/components/BaseProgress';
import StatsCard from '@/components/Cards/StatsCard';

// Tables
import SocialTrafficTable from './Dashboard/SocialTrafficTable';
import PageVisitsTable from './Dashboard/PageVisitsTable';

import Carousel from './Layout/Carousel';
import News from './Layout/News';
import Corona from './Layout/Corona';

export default {
  components: {
    Chart,
    Weather,
    Corona,
    News,
    Carousel,
    LineChart,
    BarChart,
    BaseProgress,
    StatsCard,
    PageVisitsTable,
    SocialTrafficTable,
  },

  data() {
    return {
      redBarChart: {
        chartData: {
          labels: ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
          datasets: [
            {
              label: 'Sales',
              data: [25, 20, 30, 22, 17, 29],
            },
          ],
        },
        extraOptions: chartConfigs.blueChartOptions,
      },
    };
  },
};
</script>
<style>
.el-table .cell {
  padding-left: 0px;
  padding-right: 0px;
}
</style>
