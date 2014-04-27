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
  def show_all_likes_count(post_id,current_user_id)
  	@get_count_for_all = Like.where("post_id=? and like=? and user_id!=? ",post_id,true,current_user_id)
  	@one_like = Like.where("post_id=? and like=? and user_id=?",post_id,true,current_user_id).count

  	if @get_count_for_all and @get_count_for_all.count == 1
  		id = @get_count_for_all.first.user_id
  		@user_name = Profile.find_by_user_id(id).name
  	else
  		@all_like_count = @get_count_for_all.count if @get_count_for_all.count > 0
  	end 
  	

  	if @one_like == 1 and @user_name
  		"You and #{@user_name} like this."
		elsif @one_like == 1 and @user_name.nil? and @get_count_for_all.present?
			  "You and #{@get_count_for_all.count} people like this"
		elsif @one_like and @user_name.nil? and @all_like_count.nil?
			"You like this."
    elsif @one_like == 0 and @user_name
    	"#{@user_name} like this."
    elsif @one_like == 0 and @get_count_for_all.present? and @user_name.nil?
    	"#{@get_count_for_all.count} people like this."
    end
  		
  		

  end
end
