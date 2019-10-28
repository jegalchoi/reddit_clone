class SubsController < ApplicationController
  before_action :require_moderator!, only: [:edit, :update]
  before_action :require_user!, only: [:create]

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    find_sub
  end

  def update
    find_sub

    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def index
    @subs = Sub.all
  end

  def show
    find_sub
    #@posts = Post.joins(:votes).select('SUM(value) as sum').order('sum DESC')
    @posts = @sub.posts
  end

  private
    def sub_params
      params.require(:sub).permit(:title, :description, :user_id)
    end

    def find_sub
      @sub = Sub.find_by(id: params[:id])
    end

    def require_moderator!
      find_sub
      
      unless current_user == @post.moderator
        @post.errors.add(:User, "is not moderator of sub")
        flash[:errors] = @sub.errors.full_messages 
        redirect_to sub_url(@sub) 
      end
    end
end
