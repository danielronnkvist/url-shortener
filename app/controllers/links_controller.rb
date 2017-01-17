class LinksController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @links = current_user.links
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
