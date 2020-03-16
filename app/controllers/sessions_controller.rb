class SessionsController < ApplicationController
  def new
    @user=User.new
    byebug
  end

  def create
  end
end
