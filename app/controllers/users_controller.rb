class UsersController < ApplicationController

  def new

  end

  def create

  end

  def show

  end

  def index
    @users = User.all
  end

end
