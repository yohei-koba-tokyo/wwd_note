
json.array! @users do |user|
  json.name user.name
  json.image user.image
end