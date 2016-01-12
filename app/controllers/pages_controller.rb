class PagesController < ApplicationController

  def pages
  
  end
  
  def home
    redirect_to recipes_path if logged_in?
  end
end
