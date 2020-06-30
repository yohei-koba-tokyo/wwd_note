
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
        change: true,
        popup: false
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
        createMemos: function() {
          axios.post (
            '/api/memoforms',
            {
              memos: this.memos
            }
          ).then(response => {
            this.memos = response.data
            this.copy = JSON.parse(JSON.stringify(this.memos));
            this.change = !this.change;
            this.popup = true;
            setTimeout(this.enable, 3000);
          })
        },
        changeMemos: function() {
          this.memos.forEach(function(memo) {
            axios.patch (
              '/api/memoforms/' + memo.id,
              {
                memo: memo.memo
              }
            )
          })
          this.copy = JSON.parse(JSON.stringify(this.memos));
          this.change = !this.change;
          this.popup = true;
          setTimeout(this.enable, 3000);
        },
        enable:function() {
          this.popup = false;
        }

      },
      watch: {
        memos: {
          handler: function(val, oldVal) {
            this.change = JSON.stringify(val) == JSON.stringify(this.copy) ? true : false
          },deep: true
        },
      }
    })
  })
}