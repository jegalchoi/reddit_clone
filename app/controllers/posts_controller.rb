class PostsController < ApplicationController
  before_action :require_author!, only: [:edit, :update]

  def new
    @post = Post.new
    @subs = Sub.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @subs = Sub.all
    
    if @post.save
      unless params[:sub_ids].nil?
        params[:sub_ids].each do |sub_id|
          PostSub.create!(post_id: @post.id, sub_id: sub_id)
        end
      end
      
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    find_post
    @subs = Sub.all
  end

  def update
    find_post

    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      render :edit
    end
  end

  def show
    find_post
  end

  private
    def post_params
      params.require(:post).permit(:title, :url, :content, :user_id, sub_ids: [])
    end

    def find_post
      @post = Post.find_by(id: params[:id])
    end

    def require_author!
      find_post
      redirect_to post_url(@post) unless current_user == @post.author
    end
end
