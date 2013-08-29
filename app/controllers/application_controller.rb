class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  def index
    if current_user
      @projects_all = Project.where user_id: current_user.id
    else
      render :not_signed_in, layout: false
    end
  end
end
