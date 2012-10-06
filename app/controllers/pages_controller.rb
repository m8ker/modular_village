class PagesController < ApplicationController
  
  def index
    @title = "Home"
  end
  
  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def terms
    @title = "Terms"
  end
  
end