<template>
  <b-container class="bv-example-row">
    <b-row>
      <b-col><seoul></seoul></b-col>
      <b-col><incheon></incheon></b-col>
      <b-col><gyeonggi></gyeonggi></b-col>
    </b-row>
  </b-container>
</template>
<script>
import Seoul from "./Seoul";
import Incheon from "./Incheon";
import Gyeonggi from "./Gyeonggi";

export default {
  components: {
    Seoul,
    Incheon,
    Gyeonggi,
  },
};
</script>
<style lang=""></style>
