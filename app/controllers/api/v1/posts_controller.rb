class Api::V1::PostsController < ApplicationController
  before_action :authenticate_jwt
  before_action :set_post, only: %i[show update destroy]
  after_action { pagy_headers_merge(@pagy) if @pagy }

  # GET /api/v1/posts
  # GET /api/v1/posts.json
  def index
    @pagy, @posts = pagy(Post.all)
    @metadata = pagy_metadata(@pagy)
  end

  # GET /api/v1/posts/1
  # GET /api/v1/posts/1.json
  def show
  end

  # POST /api/v1/posts
  # POST /api/v1/posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      render :show, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/posts/1
  # PATCH/PUT /api/v1/posts/1.json
  def update
    authorize @post
    if @post.update(post_params)
      render :show, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/posts/1
  # DELETE /api/v1/posts/1.json
  def destroy
    @post.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.fetch(:post, {}).permit(:title, :body).merge(user_id: Current.user.id)
  end
end
