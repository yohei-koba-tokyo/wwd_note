# coding: utf-8

projects = []
projects << [Memo.create!(user_id: 2, memo: '時間を決めて予定通り筋トレを行う事ができた。'), Memo.create!(user_id: 2, memo: '間食をしなかった。'), Memo.create!(user_id: 2, memo: '新しい技術の学習を4時間以上行った。')]
projects << [Memo.create!(user_id: 2, memo: '友人にサプライズギフトをあげて、喜んでもらえた。'), Memo.create!(user_id: 2, memo: 'teratailで人助けをした。'), Memo.create!(user_id: 2, memo: '部屋をしっかり掃除出来た。')]
projects << [Memo.create!(user_id: 2, memo: '10時間みっちり勉強した。'), Memo.create!(user_id: 2, memo: 'paizaAランクが解けた。'), Memo.create!(user_id: 2, memo: 'Vue.jsで起きていたエラーを解決出来た。')]
projects << [Memo.create!(user_id: 2, memo: '筋トレをいつもの２種類だけでなく３種類出来た。'), Memo.create!(user_id: 2, memo: '夕飯をちゃんと作った。'), Memo.create!(user_id: 2, memo: '後付モニターを購入し開発環境を改善した。')]
projects << [Memo.create!(user_id: 2, memo: 'ゲーム禁止100日突破。'), Memo.create!(user_id: 2, memo: 'teratailで人助けをした。'), Memo.create!(user_id: 2, memo: '部屋をしっかり掃除出来た。')]
projects << [Memo.create!(user_id: 2, memo: '10時間みっちり勉強した。'), Memo.create!(user_id: 2, memo: 'paizaBランクがすんなり解けた。'), Memo.create!(user_id: 2, memo: '禁酒70日目突破。')]
projects << [Memo.create!(user_id: 2, memo: '昨日と今日合計で、食事代500円以内に抑えた。'), Memo.create!(user_id: 2, memo: 'ベランダをきれいに掃除した。'), Memo.create!(user_id: 2, memo: '鉢の植え替えをした。')]

projects << [Memo.create!(user_id: 2, memo: '早起き6:30、連続40日目。'), Memo.create!(user_id: 2, memo: '元職場の後輩に色々教えてあげた'), Memo.create!(user_id: 2, memo: '「ファクトフルネス」読了した。')]
projects << [Memo.create!(user_id: 2, memo: '筋トレを３種類やった。'), Memo.create!(user_id: 2, memo: '夕食のカロリーを３００kcal以内にセーブした。'), Memo.create!(user_id: 2, memo: '友人のサプライズギフトを計画した。')]
projects << [Memo.create!(user_id: 2, memo: 'Vue.js学習開始した。'), Memo.create!(user_id: 2, memo: 'DockerFileを書いてみた。'), Memo.create!(user_id: 2, memo: '妻に花を買った。')]
projects << [Memo.create!(user_id: 2, memo: '部屋をしっかり片付けした。'), Memo.create!(user_id: 2, memo: '勉強10時間、集中できた。'), Memo.create!(user_id: 2, memo: 'splほぼマスターした。')]
projects << [Memo.create!(user_id: 2, memo: '甘いものを我慢できた。'), Memo.create!(user_id: 2, memo: 'paizaBランクすんなりとけた。'), Memo.create!(user_id: 2, memo: '時間がなかったが、勉強時間を確保出来た。')]
projects << [Memo.create!(user_id: 2, memo: '妻と見た映画がすごく面白かった。'), Memo.create!(user_id: 2, memo: '近くの公園で気分転換が出来た。'), Memo.create!(user_id: 2, memo: '')]
projects << [Memo.create!(user_id: 2, memo: '資格の勉強をした。'), Memo.create!(user_id: 2, memo: '勉強会に参加した。'), Memo.create!(user_id: 2, memo: '夕食を用意した。')]


projects.each_with_index do |project, i|
  project.each do |p|
    p.created_at = Time.now-(i+1).day
    p.save
  end
end