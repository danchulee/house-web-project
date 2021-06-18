<template>
  <div v-cloak>
    <h3>경기</h3>
    <span
      ><b-img id="경기날씨" center :src="this.경기사진" alt="경기 날씨 아이콘 로딩중..."></b-img
    ></span>
    <div>
      <h4>날씨 : {{ this.경기날씨.weather[0].description }}</h4>
      <h4>기온 : {{ this.경기기온 }}°C</h4>
      <h4>습도 : {{ this.경기습도 }}%</h4>
    </div>
  </div>
</template>
<script>
import axios from "axios";

export default {
  data() {
    return {
      경기날씨: { weather: [""] },

      경기사진: "",

      경기기온: "",

      경기습도: "",
    };
  },
  created() {
    axios
      .get(
        `http://api.openweathermap.org/data/2.5/weather?id=1841610&appid=22930ce8bd15b1c1640036cab6e46618&lang=kr`
      )
      .then(({ data }) => {
        this.경기날씨 = data;
        console.log(this.경기날씨);
        this.경기사진 =
          "http://openweathermap.org/img/wn/" + this.경기날씨.weather[0].icon + "@2x.png";
        this.경기기온 = Math.round(this.경기날씨.main.temp - 273);
        this.경기습도 = this.경기날씨.main.humidity;
      })
      .catch(() => {
        alert("경기 날씨를 읽어오는 중 오류가 발생했습니다.");
      });
  },
};
</script>
<style lang=""></style>
