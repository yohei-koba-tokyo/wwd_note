

json.array! @memos do |memo|
  json.date memo[0].to_s(:monthdate).gsub(/^0|\/0/, "^0" => "", "\/0" => "/")
  json.week memo[0].strftime(%w(日 月 火 水 木 金 土)[memo[0].wday])
  json.memo memo[1]
end