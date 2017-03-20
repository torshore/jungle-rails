class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    # @review.user = session[:user_id]
    if @review.save
      redirect_to @product, notice: "Review saved!"
    else
      render "products/show"
    end
  end

  private
    def review_params
      params.require(:review).permit(
        :product_id,
        :description,
        :rating)
    end


end
