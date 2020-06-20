class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

    def render_404
      render file: Rails.root.join('public/404.html'), status: 404, content_type: 'text/html'
    end
end
