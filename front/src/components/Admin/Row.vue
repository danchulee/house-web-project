<template>
  <tr>
    <td style="width:250px;">{{ userid }}</td>
    <td style="width:510px;">
      <router-link :to="`/member/read?userid=${userid}`">{{ username }}</router-link>
    </td>
    <td style="width:370px;">{{ userpwd }}</td>
    <td style="width:370px;">{{ email }}</td>
    <!-- <td style="width:490px;">{{ getFormatDate(joindate) }}</td> -->
    <td style="width:490px;">{{ joindate }}</td>
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
    userid: { type: String },
    username: { type: String },
    userpwd: { type: String },
    email: { type: String },
    joindate: { type: String },
    items: Array,
  },
  methods: {},
};
</script>
