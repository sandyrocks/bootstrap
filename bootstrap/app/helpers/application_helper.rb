module ApplicationHelper
  def get_welcome_name
    (current_user.email.split("@")[0].split(".")[0]).capitalize
  end
end
