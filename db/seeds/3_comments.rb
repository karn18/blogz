post = Post.find_by(title: "RoR Crash Course")
john_user = User.find_by(username: "john")
post.comments.create(user: john_user, post: post, body: "message")
