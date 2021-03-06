class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      flash[:success] = "Comment saved!"
    else
      flash[:errors] = @comment.errors.full_messages
    end
    redirect_to post_url(Post.find_by(id: @comment.post_id))
  end

  def edit
  end

  def update
  end

  def show
    find_comment
    @child_comment = Comment.new
  end

  def upvote
    find_comment
    vote_up(@comment)
  end

  def downvote
    find_comment
    vote_down(@comment)
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id, :parent_comment_id)
    end

    def find_comment
      @comment = Comment.find_by(id: params[:id])
    end
end
