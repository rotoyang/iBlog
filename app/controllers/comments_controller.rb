class CommentsController < ApplicationController

    def index
        redirect_to post_path(params[:post_id])
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params.require(:comment).permit(:username, :desc))
        if @comment.save
            flash[:notice] = "Comment was created successfully."
            redirect_to post_path(@comment.post_id)
        else
            render 'posts/show'
        end
    end
end