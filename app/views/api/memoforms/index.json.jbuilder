json.array! @todays_memos.collection do |memo|
  json.memo memo.memo
  json.id memo.id
end
