
json.array! @notes do |note|
  json.id note.id
  json.challenge note.challenge
  json.created_at note.created_at.to_s(:monthdateweek).gsub(/^0|\/0/, "^0" => "", "\/0" => "/")
  json.week note.created_at.strftime(%w((日) (月) (火) (水) (木) (金) (土))[note.created_at.wday])
  json.user note.user
  json.likes_count note.likes.length
  json.like note.likes.find_by(user_id: @current_id )
  json.comment note.comments.find_by(user_id: @current_id)
end
