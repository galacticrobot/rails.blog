class PostsController < ApplicationController

    def index
        @post = Post.all.order('created_at DESC')
    end

    def new
    end

    def create
        @post = Post.new(post_params)
        @post.save
        redirect_to @post #what to do when action is finished.
    end

    def show
        @post = Post.find(params[:id])
    end

    private
        # strong parameters - what is allowed to be saved
        def post_params
            params.require(:post).permit(:title, :body)
        end


end
