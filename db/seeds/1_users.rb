admin = User.find_or_create_by(username: "admin") do |user|
  user.password = "123456789"
  user.password_confirmation = "123456789"
  user.actived = true
  user.actived_at = DateTime.now
end
admin.add_role(:admin)

User.find_or_create_by(username: "karn") do |user|
  user.password = "123456789"
  user.password_confirmation = "123456789"
  user.actived = true
  user.actived_at = DateTime.now
end

User.find_or_create_by(username: "demo") do |user|
  user.password = "123456789"
  user.password_confirmation = "123456789"
  user.actived = true
  user.actived_at = DateTime.now
end

User.find_or_create_by(username: "john") do |user|
  user.password = "123456789"
  user.password_confirmation = "123456789"
  user.actived = true
  user.actived_at = DateTime.now
end
