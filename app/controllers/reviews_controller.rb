class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index, :like]
  before_action :require_same_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  
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

    newRecipe = @review.recipe
    existReview = Review.where(:recipe => newRecipe, :chef => current_user)
    if existReview.exists?
     flash[:danger] = "You can only create a review for this recipe once"
     render :new
    else
           if @review.save
           flash[:success] = "Your review was created successfully!"
           redirect_to reviews_path
           else
           render :new
           end
    end       
  end

  def update
    if @review.update(review_params)
      flash[:success] = "Your review was updated successfully!"
      redirect_to reviews_path
    else
      render :edit
    end  
  end

  private 
  
  def review_params
     params.require(:review).permit(:title, :recipe_id, :review_text, :rating)  
  end
  
  def set_review
    @review = Review.find(params[:id])     
  end
  
  def destroy
        Review.find(params[:id]).destroy
        flash[:success] = "Review Deleted"
        redirect_to recipes_path
  end
        
  def require_same_user
    if current_user != @review.chef and !current_user.admin?
    flash[:danger] = "You can only edit your own reviews"  
    redirect_to reviews_path
    end
  end
  
  def admin_user
    redirect_to reviews_path unless current_user.admin?
  end
  

end