class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])  
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def index
    @reviews = Review.paginate(page: params[:page], per_page: 4)
  end
  
  def create
    @review = Review.new(review_params)
    @review.chef = current_user
    if @review.save
          flash[:success] = "Your review was created successfully!"
          redirect_to reviews_path
    else
          render :new
    end  
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Your review was updated successfully!"
      redirect_to recipes_path
    else
      render :edit
    end  
  end

  private 
  def review_params
     params.require(:review).permit(:title, :recipe_id, :review_text, :rating)  
  end
  

end