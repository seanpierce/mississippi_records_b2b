class PagesController < ApplicationController

  # index route
  def home
  end

  def how_to
    @posts = Post.page_posts("how_to")
  end

  def aout_us
  end

  def links
  end

end
