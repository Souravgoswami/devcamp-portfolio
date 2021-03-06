class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout 'blog'
  access all: [:show, :index], user: { except: [:destroy, :new, :create, :update, :edit, :toggle_status] }, site_admin: :all
  before_action :set_sidebar_topics, except: [:create, :update, :destroy, :toggle_status]

  # GET /blogs
  # GET /blogs.json
  def index
    # @blogs = Blog.special_blogs
    @blogs = if logged_in?(:site_admin)
      Blog.recent.page(params[:page]).per(5)
    else
      Blog.published.recent.page(params[:page]).per(5)
    end

    @page_title = "My Portfolio Blog".freeze
    # show random number of items
    # @blogs = Blog.limit(rand(1..3))
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new

      @page_title = @blog.title
      @seo_keywords = @blog.body &.split &.first(12) &.join(' ')
    else
      redirect_to blogs_path, notice: 'You are not authorized to view this page'
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.topic_id = Topic.last.id unless params[:topic_id]

    respond_to do |format|
      if @blog.save

        format.html { redirect_to @blog, notice: 'Your post is now live!' }
        # format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        # format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Post removed!' }
      # format.json { head :no_content }
    end
  end

  def toggle_status
    @blog.draft? ? @blog.published! : @blog.draft!
    redirect_to blogs_url, notice: 'Post status has been updated'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      # config.action_controller.permit_all_parameters = true
      # Can be added to /config/application.rb
      # In order to remove permit() with the cost of compromising security
      params.require(:blog).permit(:title, :body, :topic_id, :status)
    end

    def set_sidebar_topics
      @sidebar_topics = Topic.with_blogs
    end
end
