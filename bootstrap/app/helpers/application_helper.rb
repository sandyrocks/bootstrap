module ApplicationHelper
  def get_welcome_name
    (current_user.email.split("@")[0].split(".")[0]).capitalize
  end
  def get_post_name(id)
  	user = User.find(id).email.split("@")[0].split(".")[0].capitalize
  end
  def count_comments(id)
  	comment = Comment.where("post_id=?",id).count
  end
end
