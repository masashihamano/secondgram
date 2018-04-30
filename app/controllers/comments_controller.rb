class CommentsController < ApplicationController

  def new
    @comment = Comment.new(topic_id: params[:topic_id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.topic_id = params[:comment][:topic_id]

    if @comment.save
      redirect_to topics_path, notice: 'コメントに成功しました'
    else
      flash.now[:alert] = "コメントに失敗しました"
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :body2, :body3)
    end

end
