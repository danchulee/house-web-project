<template>
  <div>
    <b-carousel
      id="carousel-1"
      v-model="slide"
      :interval="3000"
      controls
      indicators
      background="#FFFFFF"
      img-width="1024"
      img-height="1300"
      style=""
      @sliding-start="onSlideStart"
      @sliding-end="onSlideEnd"
      class="border border-white"
    >
      <b-carousel-slide caption="" img-blank img-alt="서울">
        <hr />
        <h1>서울</h1>
        <h4>날씨 : {{ this.서울날씨.weather[0].description }}</h4>
        <h4>기온 : {{ this.서울기온 }}°C</h4>
        <h4>습도 : {{ this.서울습도 }}%</h4>
      </b-carousel-slide>
      <b-carousel-slide caption="" img-blank img-alt="경기">
        <hr />
        <h1>경기</h1>
        <h4>날씨 : {{ this.경기날씨.weather[0].description }}</h4>
        <h4>기온 : {{ this.경기기온 }}°C</h4>
        <h4>습도 : {{ this.경기습도 }}%</h4>
      </b-carousel-slide>
      <b-carousel-slide caption="" img-blank img-alt="인천">
        <hr />
        <h1>인천</h1>
        <h4>날씨 : {{ this.인천날씨.weather[0].description }}</h4>
        <h4>기온 : {{ this.인천기온 }}°C</h4>
        <h4>습도 : {{ this.인천습도 }}%</h4>
      </b-carousel-slide>
      <!-- <b-carousel-slide
        caption="First slide"
        text="Nulla vitae elit libero, a pharetra augue mollis interdum."
        img-src="https://picsum.photos/1024/1300/?image=52"
      ></b-carousel-slide>
      <b-carousel-slide
        caption="First slide"
        text="Nulla vitae elit libero, a pharetra augue mollis interdum."
        img-src="https://picsum.photos/1024/1300/?image=52"
      ></b-carousel-slide>
      <b-carousel-slide
        caption="First slide"
        text="Nulla vitae elit libero, a pharetra augue mollis interdum."
        img-src="https://picsum.photos/1024/1300/?image=52"
      ></b-carousel-slide>
      <b-carousel-slide
        caption="First slide"
        text="Nulla vitae elit libero, a pharetra augue mollis interdum."
        img-src="https://picsum.photos/1024/1300/?image=52"
      ></b-carousel-slide> -->
    </b-carousel>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      slide: 0,
      sliding: null,
      인천날씨: { weather: [""] },
      인천사진: "",
      인천기온: "",
      인천습도: "",
      경기날씨: { weather: [""] },
      경기사진: "",
      경기기온: "",
      경기습도: "",
      서울날씨: { weather: [""] },
      서울사진: "",
      서울기온: "",
      서울습도: "",
    };
  },
  created() {
    axios
      .get(
        "http://api.openweathermap.org/data/2.5/weather?id=1843561&appid=22930ce8bd15b1c1640036cab6e46618&lang=kr"
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
    axios
      .get(
        "http://api.openweathermap.org/data/2.5/weather?id=1841610&appid=22930ce8bd15b1c1640036cab6e46618&lang=kr"
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
    axios
      .get(
        "http://api.openweathermap.org/data/2.5/weather?id=1835848&appid=22930ce8bd15b1c1640036cab6e46618&lang=kr"
      )
      .then(({ data }) => {
        this.서울날씨 = data;
        console.log(this.서울날씨);
        this.서울사진 =
          "http://openweathermap.org/img/wn/" + this.서울날씨.weather[0].icon + "@2x.png";
        this.서울기온 = Math.round(this.서울날씨.main.temp - 273);
        this.서울습도 = this.서울날씨.main.humidity;
      })
      .catch(() => {
        alert("서울 날씨를 읽어오는 중 오류가 발생했습니다.");
      });
  },
  methods: {
    onSlideStart(slide) {
      this.sliding = true;
    },
    onSlideEnd(slide) {
      this.sliding = false;
    },
  },
};
</script>
