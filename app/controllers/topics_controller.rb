class TopicsController < ApplicationController
  layout 'blog'
  before_action :set_sidebar_topics

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])

    @blogs = if logged_in?(:site_admin)
     @topic.blogs.recent.page(params[:page]).per(5)
    else
      @topic.blogs.published.recent.page(params[:page]).per(5)
    end
  end

  private
  def set_sidebar_topics
    @sidebar_topics = Topic.with_blogs
  end
end
