class PagesController < ApplicationController

  # index route
  def home
  end

  def how_to
    @posts = Post.page_posts("how_to")
  end

  def about_us
    @posts = Post.page_posts("about")
  end

  def links
  end

end
