class Admin::PostCommentsController < ApplicationController
   def create
    ramen = Ramen.find(params[:ramen_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.ramen_id = ramen.id
    comment.save
    redirect_to public_ramensadmin_ramens_path(ramen)
   end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admin_ramen_path(params[:ramen_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end

