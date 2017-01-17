class LinksController < ApplicationController
  before_action :authenticate_user!, except: :redirect

  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to links_path, notice: 'Succesfully created link'
    else
      render :new, notice: 'There was an error creating your link...'
    end
  end

  def redirect
    @link = Link.find_by(shortened: params[:shortened])
    if @link
      redirect_to @link.original
    else
      redirect_to root_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:original)
  end
end
