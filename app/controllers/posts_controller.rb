class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    # @user = User.find(params[:id])
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
