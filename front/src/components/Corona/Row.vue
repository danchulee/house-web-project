<template>
  <tr v-if="checkCountry()">
    <td style="width:250px;">{{ countryName }}</td>
    <td style="width:250px;">{{ newCase }}</td>
    <td style="width:250px;">{{ totalCase }}</td>
    <td style="width:250px;">{{ recovered }}</td>
    <td style="width:250px;">{{ death }}</td>
  </tr>
</template>

<script>
import { Table, TableColumn } from "element-ui";

export default {
  name: "row",
  components: {
    [Table.name]: Table,
    [TableColumn.name]: TableColumn,
  },
  props: {
    countryName: { type: String },
    newCase: { type: String },
    totalCase: { type: String },
    recovered: { type: String },
    death: { type: String },
    items: Array,
  },
  methods: {
    checkCountry() {
      if (
        this.countryName == "합계" ||
        this.countryName == "서울" ||
        this.countryName == "경기" ||
        this.countryName == "인천"
      )
        return true;
      else return false;
    },
  },
};
</script>
