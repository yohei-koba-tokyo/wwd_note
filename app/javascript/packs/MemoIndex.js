/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

// import Vue from 'vue'
// import App from '../app.vue'

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     render: h => h(App)
//   }).$mount()
//   document.body.appendChild(app.$el)

//   console.log(app)
// })


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>

import axios from 'axios'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#memoindex',
    data: {
      memos: [],
      page : 1,
      perPage: 7,
      totalPage: 0,
      count: 0,
      hoverFlag: false,
      hoverIndex: null,
      noteUrl: "",
      users: []
    },
    components: { App },
    mounted () {
      axios
        .get (
          '/memos/pagenation.json'
        )
        .then(response =>{
        this.memos = response.data;
        this.count = response.data.length;
        this.totalPage = Math.ceil(this.count / this.perPage);
      });
      axios
        .get (
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
      }
    },
    computed: {
      filterMemos() {
        return this.memos.slice((this.page - 1) * this.perPage, this.page * this.perPage);
      }
    }
  })
})
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
