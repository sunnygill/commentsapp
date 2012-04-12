class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    respond_to do |format|
      format.html # index.html.erb
      format.rss
    end
  end

  def create
    @comment = Comment.create!(params[:comment])
    flash[:notice] = "Thanks for commenting!"
    respond_to do |format|
      format.html { redirect_to comments_path }
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_path }
      format.js
    end
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end