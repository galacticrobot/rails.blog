class PostsController < ApplicationController

    def index
        @posts = Post.all.order('created_at DESC') #Get all posts and order them desc by creatin date
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params) #defined below in private

        if
            @post.save          #If the post is saved
            redirect_to @post   #Go to that post
        else
            render 'new'        #otherwise, render the new template again (with content intact)
        end
    end

    def show
        @post = Post.find(params[:id]) #find posts by ID.
    end

    def edit
        @post = Post.find(params[:id]) #find posts to edit by ID
    end

    def update
        @post = Post.find(params[:id])
        if
            @post.update(params[:post].permit(:title, :body))
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])  #find item
        @post.destroy                   #destroy it
        redirect_to root_path           #redirect to root
    end

    private
        # strong parameters - what is allowed to be saved. In this case title and body.
        def post_params
            params.require(:post).permit(:title, :body)
        end


end
