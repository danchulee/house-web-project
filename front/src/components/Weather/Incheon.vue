<template>
  <div v-cloak>
    <h3>인천</h3>
    <span
      ><b-img id="인천날씨" center :src="this.인천사진" alt="인천 날씨 아이콘 로딩중..."></b-img
    ></span>
    <div>
      <h4>날씨 : {{ this.인천날씨.weather[0].description }}</h4>
      <h4>기온 : {{ this.인천기온 }}°C</h4>
      <h4>습도 : {{ this.인천습도 }}%</h4>
    </div>
  </div>
</template>
<script>
import axios from "axios";

export default {
  data() {
    return {
      인천날씨: { weather: [""] },

      인천사진: "",

      인천기온: "",

      인천습도: "",
    };
  },
  created() {
    axios
      .get(
        `http://api.openweathermap.org/data/2.5/weather?id=1843561&appid=22930ce8bd15b1c1640036cab6e46618&lang=kr`
      )
      .then(({ data }) => {
        this.인천날씨 = data;
        console.log(this.인천날씨);
        this.인천사진 =
          "http://openweathermap.org/img/wn/" + this.인천날씨.weather[0].icon + "@2x.png";
        this.인천기온 = Math.round(this.인천날씨.main.temp - 273);
        this.인천습도 = this.인천날씨.main.humidity;
      })
      .catch(() => {
        alert("인천 날씨를 읽어오는 중 오류가 발생했습니다.");
      });
  },
};
</script>
<style lang=""></style>
