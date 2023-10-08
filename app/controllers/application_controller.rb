class ApplicationController < ActionController::Base
  before_action :set_user

  def admin_only
    redirect_to root_path unless @current_user.is_admin
  end

  def moderator_only
    redirect_to root_path unless @current_user.is_admin
  end

  def logged_in
    redirect_to root_path unless @current_user.is_admin
  end

  def set_user
    logger.debug 'finding out if the user is logged in'
    # find user in session
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by_id session[:user_id]
    end

    # auth user by username and password
    if @current_user.nil? && params[:user].is_a?(ActionController::Parameters)
      @current_user = User.find_by( name: params[:user][:name], password_hash: params[:user][:password] )
    end

    if @current_user
      logger.debug('user was logged in')
      session[:user_id] = @current_user.id
    else
      logger.debug('user is anonymous')
      @current_user = User.new
      @current_user.level = 0b000
    end
  end
end
