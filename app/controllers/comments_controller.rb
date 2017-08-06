class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if current_user.comments << @comment
      redirect_to post_path(@post)
    else
      render "/posts/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :body)
  end
end
