class PostsController < ApplicationController

    def index
        @posts = Post.all.order('created_at DESC') #Get all posts and order them desc by creatin date
    end

    def new
    end

    def create
        @post = Post.new(post_params) #defined below in private
        @post.save
        redirect_to @post #what to do when action is finished.
    end

    def show
        @post = Post.find(params[:id]) #find posts by ID.
    end

    private
        # strong parameters - what is allowed to be saved. In this case title and body.
        def post_params
            params.require(:post).permit(:title, :body)
        end


end
