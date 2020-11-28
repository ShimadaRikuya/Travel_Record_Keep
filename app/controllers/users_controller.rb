class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]

  def mypage
    @users = current_user
  end

  def show
    @users = current_user
  end

end
