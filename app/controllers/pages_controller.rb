class PagesController < ApplicationController
  def home
    @title = "Home"
    @request = Request.new(:owner=>current_user) if signed_in?
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end

end
