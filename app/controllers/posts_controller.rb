class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :destroy]
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        # @posts = Post.all
        @pagy, @posts = pagy(Post.all)
    end

    def new
        @post = Post.new
    end

    def edit
    end

    def create
        @post = Post.new(post_params)
        # render plain: @post.inspect
        if @post.save
            flash[:notice] = "Post was created successfully."
            # redirect_to post_path(@post)
            redirect_to @post
        else
            render 'new'
        end
    end

    def update
        if @post.update(post_params)
            flash[:notice] = "Post was updated successfully."
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        flash[:notice] = "Post was deleted successfully."
        redirect_to posts_path
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :desc)
    end

end