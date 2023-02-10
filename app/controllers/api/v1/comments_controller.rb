class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_jwt
  # before_action :set_post
  before_action :set_comment, only: %i[show update destroy]
  after_action { pagy_headers_merge(@pagy) if @pagy }

  # GET /comments
  # GET /comments.json
  def index
    @pagy, @comments = pagy(Comment.joins(:post).all)
    @metadata = pagy_metadata(@pagy)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render :show, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update(comment_params)
      render :show, status: :ok, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.joins(:post).find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.fetch(:comment, {})
  end
end
