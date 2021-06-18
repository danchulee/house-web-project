<template>
  <tr>
    <td style="width:250px;">{{ no }}</td>
    <td style="width:510px;">
      <router-link :to="`/board/read?no=${no}`">{{ title }}</router-link>
    </td>
    <td style="width:370px;">{{ writer }}</td>
    <td style="width:490px;">{{ getFormatDate(regtime) }}</td>
  </tr>
</template>

<script>
import moment from "moment";
import { Table, TableColumn } from "element-ui";

export default {
  name: "row",
  components: {
    [Table.name]: Table,
    [TableColumn.name]: TableColumn,
  },
  props: {
    no: { type: Number },
    writer: { type: String },
    title: { type: String },
    regtime: { type: String },
    items: Array,
  },
  methods: {
    getFormatDate(regtime) {
      return moment(new Date(regtime)).format("YYYY.MM.DD");
    },
  },
};
</script>
