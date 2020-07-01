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
        searchWord: "",
        onlyFollowers: false,
        onlyFollowings: false,
        notes: [],
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
        }).catch(error => {
          console.log(error)
          console.log("data_empty?")
        })
        axios.get (
          '/api/relationships'
        )
        .then(response =>{
          this.users = response.data;
        });
        axios.get (
          '/memos/timeline.json'
        ).then(response =>{
          this.notes = response.data;
      })
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
        unFollowUser: function(id) {
          axios.delete (
            '/api/relationships/' + id,
          ).then(response => {
            let pick = this.users.find(user => user.id == response.data.id)
            pick.follow_id = null
          })
        },
        pushFollowersBtn: function() {
          this.onlyFollowers = !this.onlyFollowers
          if (this.onlyFollowings) {this.onlyFollowings = !this.onlyFollowings}
        },
        pushFollowingBtn: function() {
          this.onlyFollowings = !this.onlyFollowings
          if (this.onlyFollowers) {this.onlyFollowers = !this.onlyFollowers}
        }
      },
      computed: {
        filterMemos() {
          return this.memos.slice((this.page - 1) * this.perPage, this.page * this.perPage);
        },
        filterUsers: function() {
          var self = this
          return this.users.filter(function(user) {
            var onlyFollowerMode = (user.follower_id == null && self.onlyFollowers) ? true : false
            var onlyFollowingMode = (user.follow_id == null && self.onlyFollowings) ? true : false
            user = user.name.indexOf(self.searchWord) !== -1;
            if (!onlyFollowerMode && !onlyFollowingMode) {return user}
          })
        },
        followingUsers: function() {
          return this.users.filter(function(user){
            if (user.follow_id !== null) {return user}
          })
        },
        filterNotes: function() {
          var userIds = this.followingUsers.map(function(user){return user.id})
          userIds.push
          return this.notes.filter(function(note){
            if (userIds.includes(note.user.id)){return note}
          })
        }
      }
    })
  })
}