
import axios from 'axios'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

if (document.getElementById('memo_form') !== null) {
  document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
      el: '#memo_form',
      data: {
        memos: [],
        copy: [],
        change: true
      },
      components: { App },

      mounted () {
        axios.get (
          '/api/memoforms'
        )
        .then(response =>{
          this.memos = response.data
          // 以下はコピーを作成するための記述
          this.copy = JSON.parse(JSON.stringify(this.memos))
        })
      },
      methods: {
        changeMemos: function() {
          this.memos.forEach(function(memo) {
            axios.patch (
              '/api/memoforms/' + memo.id,
              {
                memo: memo.memo
              }
            ).then(response => {
              console.log(response.config.data)
            })
          })
        }
      },
      watch: {
        memos: {
          handler: function(val) {
            this.change = JSON.stringify(val) == JSON.stringify(this.copy) ? true : false
          },deep: true
        }
      }
    })
  })
}