# coding: utf-8

# memos = []
# memos << [Memo.create!(user_id: 2, memo: '時間を決めて予定通り筋トレを行う事ができた。'), Memo.create!(user_id: 2, memo: '間食をしなかった。'), Memo.create!(user_id: 2, memo: '新しい技術の学習を4時間以上行った。')]
# memos << [Memo.create!(user_id: 2, memo: '友人にサプライズギフトをあげて、喜んでもらえた。'), Memo.create!(user_id: 2, memo: 'teratailで人助けをした。'), Memo.create!(user_id: 2, memo: '部屋をしっかり掃除出来た。')]
# memos << [Memo.create!(user_id: 2, memo: '10時間みっちり勉強した。'), Memo.create!(user_id: 2, memo: 'paizaAランクが解けた。'), Memo.create!(user_id: 2, memo: 'Vue.jsで起きていたエラーを解決出来た。')]
# memos << [Memo.create!(user_id: 2, memo: '筋トレをいつもの２種類だけでなく３種類出来た。'), Memo.create!(user_id: 2, memo: '夕飯をちゃんと作った。'), Memo.create!(user_id: 2, memo: '後付モニターを購入し開発環境を改善した。')]
# memos << [Memo.create!(user_id: 2, memo: 'ゲーム禁止100日突破。'), Memo.create!(user_id: 2, memo: 'teratailで人助けをした。'), Memo.create!(user_id: 2, memo: '部屋をしっかり掃除出来た。')]
# memos << [Memo.create!(user_id: 2, memo: '10時間みっちり勉強した。'), Memo.create!(user_id: 2, memo: 'paizaBランクがすんなり解けた。'), Memo.create!(user_id: 2, memo: '禁酒70日目突破。')]
# memos << [Memo.create!(user_id: 2, memo: '昨日と今日合計で、食事代500円以内に抑えた。'), Memo.create!(user_id: 2, memo: 'ベランダをきれいに掃除した。'), Memo.create!(user_id: 2, memo: '鉢の植え替えをした。')]

# memos << [Memo.create!(user_id: 2, memo: '早起き6:30、連続40日目。'), Memo.create!(user_id: 2, memo: '元職場の後輩に色々教えてあげた'), Memo.create!(user_id: 2, memo: '「ファクトフルネス」読了した。')]
# memos << [Memo.create!(user_id: 2, memo: '筋トレを３種類やった。'), Memo.create!(user_id: 2, memo: '夕食のカロリーを３００kcal以内にセーブした。'), Memo.create!(user_id: 2, memo: '友人のサプライズギフトを計画した。')]
# memos << [Memo.create!(user_id: 2, memo: 'Vue.js学習開始した。'), Memo.create!(user_id: 2, memo: 'DockerFileを書いてみた。'), Memo.create!(user_id: 2, memo: '妻に花を買った。')]
# memos << [Memo.create!(user_id: 2, memo: '部屋をしっかり片付けした。'), Memo.create!(user_id: 2, memo: '勉強10時間、集中できた。'), Memo.create!(user_id: 2, memo: 'splほぼマスターした。')]
# memos << [Memo.create!(user_id: 2, memo: '甘いものを我慢できた。'), Memo.create!(user_id: 2, memo: 'paizaBランクすんなりとけた。'), Memo.create!(user_id: 2, memo: '時間がなかったが、勉強時間を確保出来た。')]
# memos << [Memo.create!(user_id: 2, memo: '妻と見た映画がすごく面白かった。'), Memo.create!(user_id: 2, memo: '近くの公園で気分転換が出来た。'), Memo.create!(user_id: 2, memo: '')]
# memos << [Memo.create!(user_id: 2, memo: '資格の勉強をした。'), Memo.create!(user_id: 2, memo: '勉強会に参加した。'), Memo.create!(user_id: 2, memo: '夕食を用意した。')]

# memos.each_with_index do |memo, i|
#   memo.each do |p|
#     p.created_at = Time.now-(i+1).day
#     p.save
#   end
# end



7.times do |feeling_num|
  Feeling.create!(feel:feeling_num, image: open("#{Rails.root}/db/fixtures/pic_#{feeling_num}.png"))
end