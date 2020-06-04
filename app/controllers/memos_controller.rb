class MemosController < ApplicationController
  def index
    @users = User.all
  end
end
