class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_index

  private

    def redirect_index
      redirect_to url_for(action: :index), flash: { danger: "You're not authorized to access the page." }
    end
end
