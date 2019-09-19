class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    

    if @comment.save
      redirect_to post_url(Post.find_by(id: @comment.post_id))
    else
      redirect_to post_url(Post.find_by(id: @comment.post_id))
    end
  end

  def edit
  end

  def update
  end

  def show
    @child_comment = Comment.new
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id, :parent_comment_id)
    end
end
