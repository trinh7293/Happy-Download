class FeedbacksController < ApplicationController
  before_action :find_feedback, except: [:index, :new, :create]
  before_action :authenticate_user!

  def show
    respond_to do |format|
      format.html{redirect_to @feedback.product}
    end
  end

  def create
    @product = Product.find_by id: params[:feedback][:product_id]
    @feedback = current_user.feedbacks.build feedback_params
    if @feedback.save
      NotificationService.new(action: @feedback, notice_type: "comment",
        current_user: current_user).create_notification
      @feedback = current_user.feedbacks.new
    end
    respond_to do |format|
      format.html{redirect_to @product}
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html{redirect_to @feedback.product}
      format.js
    end
  end

  def update
    respond_to do |format|
      if @feedback.update_attributes feedback_params
        format.html do
          redirect_to @feedback, notice: t(".feedback_updated_success")
        end
      else
        format.js
      end
    end
  end

  def destroy
    @product = @feedback.product
    if @feedback.destroy
      respond_to do |format|
        format.html{redirect_to @feedback.product}
        format.js
      end
    end
  end

  private
  def find_feedback
    @feedback = Feedback.find_by id: params[:id]
    redirect_to root_path unless @feedback
  end

  def feedback_params
    params.require(:feedback).permit :content, :product_id
  end
end
