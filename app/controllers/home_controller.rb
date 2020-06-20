class HomeController < ApplicationController
  def index
    current_user&.yield_self { |user| redirect_to user_path(user) }
  end

  def about; end
end
