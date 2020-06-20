module UsersHelper
  def profile_image_path(user)
    attachment_url(user, :profile_image) || 'no_image.png'
  end

  def current_user?(user)
    user == current_user
  end
end
