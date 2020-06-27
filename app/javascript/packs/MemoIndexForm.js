import axios from 'axios'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#memo_form',
    data: {
      memos: []
    },
    components: { App },
    mounted () {
      axios.get (
        '/api/memoforms'
      )
      .then(response =>{
        this.memos = response.data
      })
    },
    methods: {
      changeMemos: function() {
        // let memo = this.memos[0]
        // axios.patch (
        //   '/api/memoforms/' + memo.id,
        //   {
        //     memo: memo.memo
        //   }
        // )
        this.memos.forEach(function(memo) {
          axios.patch (
            '/api/memoforms/' + memo.id,
            {
              memo: memo.memo
            }
          ).then(response => {
            console.log(response)
          })
        })
      }
    }
  })
})