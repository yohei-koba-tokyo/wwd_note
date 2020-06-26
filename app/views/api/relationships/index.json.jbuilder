json.array! @users_pack do |user|
  json.id user[0].id
  json.name user[0].name
  json.image user[0].image
  json.follow_id user[1]
  json.own_id @current_user
end
