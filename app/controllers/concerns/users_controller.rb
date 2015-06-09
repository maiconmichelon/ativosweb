class UsersController < ApplicationController
  before_action :set_user

  def show
    respond_with(@user)
  end

private
  def set_user
    @user = User.find(params[:id])
  end

end