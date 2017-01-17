class PagesController < ApplicationController
  def home
    redirect_to links_path if user_signed_in?
  end
end
