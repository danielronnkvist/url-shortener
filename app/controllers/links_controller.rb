class LinksController < ApplicationController
  before_action :authenticate_user!, except: :redirect

  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end

  def redirect
    @link = Link.find_by(shortened: params[:shortened])
    if @link
      redirect_to @link.original
    else
      redirect_to root_path
    end
  end
end
