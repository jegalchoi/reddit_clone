class PostsController < ApplicationController
  before_action :require_author!, only: [:edit, :update]
  before_action :require_user!, only: [:new, :create, :upvote, :downvote]

  def new
    @post = Post.new
    @subs = Sub.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_ids = params[:sub_ids]
    @subs = Sub.all
    
    if @post.save
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
    @subs = Sub.all

    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    find_post
    @comments_by_parent_id = @post.comments_by_parent_id
  end

  def upvote
    find_post
    vote_up(@post)
  end

  def downvote
    find_post
    vote_down(@post)
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
      
      unless current_user == @post.author
        @post.errors.add(:User, "is not author of sub")
        flash[:errors] = @post.errors.full_messages 
        redirect_to post_url(@post) 
      end
    end
end
