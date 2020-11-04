class PostsController < ApplicationController

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.create(post_params)
        @post.likes = 0

        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end

    end

    def show
        @post = Post.find(params[:id])
    end

    def liked
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end
end
