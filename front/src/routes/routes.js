import DashboardLayout from '@/views/Layout/DashboardLayout.vue';
import AuthLayout from '@/views/Pages/AuthLayout.vue';

import NotFound from '@/views/NotFoundPage.vue';

const routes = [
  {
    path: '/',
    redirect: 'dashboard',
    component: DashboardLayout,
    children: [
      {
        path: '/dashboard',
        name: 'dashboard',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Dashboard.vue'),
      },
      {
        path: '/profile',
        name: 'profile',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Pages/UserProfile.vue'),
      },
      {
        path: '/member/list',
        name: 'admin-list',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Admin/AdminList.vue'),
      },
      {
        path: '/member/read',
        name: 'admin-read',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Admin/AdminRead.vue'),
      },
      {
        path: '/member/update',
        name: 'admin-update',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Admin/AdminUpdate.vue'),
      },
      {
        path: '/member/delete',
        name: 'admin-delete',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Admin/AdminDelete.vue'),
      },
      {
        path: '/board/list',
        name: 'board-list',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Board/BoardList.vue'),
      },
      {
        path: '/board/create',
        name: 'board-create',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Board/BoardCreate.vue'),
      },
      {
        path: '/board/read',
        name: 'board-read',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Board/BoardRead.vue'),
      },
      {
        path: '/board/update',
        name: 'board-update',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Board/BoardUpdate.vue'),
      },
      {
        path: '/board/delete',
        name: 'board-delete',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Board/BoardDelete.vue'),
      },
      {
        path: '/notice/list',
        name: 'notice-list',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Notice/NoticeList.vue'),
      },
      {
        path: '/notice/create',
        name: 'notice-create',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Notice/NoticeCreate.vue'),
      },
      {
        path: '/notice/read',
        name: 'notice-read',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Notice/NoticeRead.vue'),
      },
      {
        path: '/notice/update',
        name: 'notice-update',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Notice/NoticeUpdate.vue'),
      },
      {
        path: '/notice/delete',
        name: 'notice-delete',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Notice/NoticeDelete.vue'),
      },
      {
        path: '/apts',
        name: 'apts',
        component: () => import(/* webpackChunkName: "demo" */ '../views/AptList.vue'),
      },
    ],
  },
  {
    path: '/',
    redirect: 'login',
    component: AuthLayout,
    children: [
      {
        path: '/login',
        name: 'login',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Pages/Login.vue'),
      },
      {
        path: '/member/register',
        name: 'register',
        component: () => import(/* webpackChunkName: "demo" */ '../views/Pages/Register.vue'),
      },
      { path: '*', component: NotFound },
    ],
  },
];

export default routes;
