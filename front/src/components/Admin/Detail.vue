<template>
  <div>
    <table class="table table-bordered">
      <tr>
        <th>ID</th>
        <td>{{ userid }}</td>
      </tr>
      <tr>
        <th>이름</th>
        <td>{{ username }}</td>
      </tr>
      <tr>
        <th>PW</th>
        <td>{{ userpwd }}</td>
      </tr>
      <tr>
        <th>e-mail</th>
        <td>{{ email }}</td>
      </tr>
      <tr>
        <th>가입날짜</th>
        <td>{{ joindate }}</td>
      </tr>
    </table>

    <br />
    <div class="text-center">
      <router-link to="/member/list"><button class="btn btn-primary">목록</button></router-link>
      &nbsp;
      <router-link :to="'/member/update?userid=' + userid"
        ><button class="btn btn-primary">수정</button></router-link
      >
      &nbsp;
      <router-link :to="'/member/delete?userid=' + userid"
        ><button class="btn btn-primary">삭제</button></router-link
      >
    </div>
    <br />
  </div>
</template>

<script>
export default {
  name: "detail",
  props: {
    userid: { type: String },
    username: { type: String },
    userpwd: { type: String },
    email: { type: String },
    joindate: { type: String },
  },
  methods: {},
};
</script>
