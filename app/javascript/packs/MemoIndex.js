import axios from 'axios'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

if (document.getElementById('memo') !== null) {
  document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
      el: '#memo',
      data: {
        memos: [],
        page : 1,
        perPage: 7,
        totalPage: 0,
        count: 0,
        hoverFlag: false,
        hoverIndex: null,
        hoverUserFlag: false,
        hoverUserIndex: null,
        noteUrl: "",
        users: [],
      },
      components: { App },
      mounted () {
        axios.get (
          '/memos/pagenation.json'
        )
        .then(response =>{
          this.memos = response.data;
          this.count = response.data.length;
          this.totalPage = Math.ceil(this.count / this.perPage);
        });
        axios.get (
          '/api/relationships'
        )
        .then(response =>{
          this.users = response.data;
        });
      },
      methods: {
        countUp: function() {
          this.page= Math.max(this.page- 1, 1);
        },
        countDown: function() {
          this.page= Math.min(this.page+ 1, this.totalPage);
        },
        createNoteNewUrl: function(id) {
          this.noteUrl= "notes/new." + id
        },
        createNoteEditUrl: function(id) {
          this.noteUrl= "notes/" + id + "/edit"
        },
        mouseOverAction: function(id) {
          this.hoverFlag = true
          this.hoverIndex = id
        },
        mouseLeaveAction: function() {
          this.hoverFlag= false
        },
        mouseOverUser: function(id) {
          this.hoverUserFlag = true
          this.hoverUserIndex = id 
        },
        mouseLeaveUser: function() {
          this.hoverUserFlag = false
        },
        followUser: function(id, own_id) {
          axios.post (
            '/api/relationships',
            {
              user_id: own_id,
              follow_id: id
            }
          ).then(response => {
            let pick = this.users.find(user => user.id == response.data.id)
            pick.follow_id = response.data.follow_id
          })
          .catch(error => {
            console.log(error);
          });
        },
        unfollowUser: function(id) {
          axios.delete (
            '/api/relationships/' + id,
          ).then(response => {
            let pick = this.users.find(user => user.id == response.data.id)
            pick.follow_id = null
          })
        }
      },
      computed: {
        filterMemos() {
          return this.memos.slice((this.page - 1) * this.perPage, this.page * this.perPage);
        }
      }
    })
  })
}