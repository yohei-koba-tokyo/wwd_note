
json.array! @notes do |note|
#   json.date memo[0].to_s(:monthdate).gsub(/^0|\/0/, "^0" => "", "\/0" => "/")
#   json.week memo[0].strftime(%w(日 月 火 水 木 金 土)[memo[0].wday])
#   json.memo memo[1]
  json.id note.id
  json.challenge note.challenge
  json.created_at note.created_at.to_s(:monthdateweek).gsub(/^0|\/0/, "^0" => "", "\/0" => "/")
  json.week note.created_at.strftime(%w((日) (月) (火) (水) (木) (金) (土))[note.created_at.wday])
  json.user note.user
end