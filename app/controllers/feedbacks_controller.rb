class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def create
    @product = Product.find_by id: params[:feedback][:product_id]
    @feedback = current_user.feedbacks.build feedback_params
    respond_to do |format|
      if @feedback.save
        format.html{redirect_to @product}
      else
        format.html{render :new}
        format.json do
          render json: @feedback.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html do
          redirect_to @feedback, notice: "Feedback was successfully updated."
        end
        format.json{render :show, status: :ok, location: @feedback}
      else
        format.html{render :edit}
        format.json do
          render json: @feedback.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html{redirect_to @feedback.product}
      format.json{head :no_content}
    end
  end

  private
  def set_feedback
    @feedback = Feedback.find_by id: params[:id]
  end

  def feedback_params
    params.require(:feedback).permit :content, :product_id
  end
end
