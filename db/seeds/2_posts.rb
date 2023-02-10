user = User.find_by(username: "karn")
Post.find_or_create_by(title: "RoR Crash Course") do |post|
  post.body = "คอร์ส Ruby on Rails สุดปัง หรือสุดพังกันนะ มาดูกันเถอะ"
  post.user = user
end

Post.find_or_create_by(title: "Ruby 101") do |post|
  post.body = "ถ้าจะเริ่มเขียน Ruby แบบ 101 ควรจะอ่านหนังสือ หรือหาคอร์สออนไลน์ที่ไหนดี"
  post.user = user
end

Post.find_or_create_by(title: "Ruby is dead in 2023") do |post|
  post.body = "ใครจะไปรู้ปีนี้ Ruby จะตายไปจริงๆ อะป่าว"
  post.user = user
end
