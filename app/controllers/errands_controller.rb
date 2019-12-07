# require 'Date'
class ErrandsController < ApplicationController

	before_action :find_by_id, only: [:show, :edit, :update]
	before_action :find_by_id_for_pickup, only: [:editpickup]
	
	def index
		case params[:format].to_i
		when 0
			@errands = Errand.where("user_id <> #{session[:current_user_id]} and runner_user_id isnull")#.joins(:category, :user).select('errands.*, categories.category, users.*')
		when 1
			@errands = Errand.where("user_id = #{session[:current_user_id]}")#.joins(:category, :user)#.select('errands.*, categories.category, users.*')
		when 2
			@errands = Errand.where("runner_user_id = #{session[:current_user_id]}")#.joins(:category, :user).select('errands.*, categories.category, users.first_name, users.last_name')
		else
			@errands = Errand.where("user_id <> #{session[:current_user_id]} and runner_user_id isnull")#.joins(:category, :user).select('errands.*, categories.category, users.first_name, users.last_name')
		end
		# byebug
	end

	  def show
		
    @comment = Comment.find_by("errand_id = #{params[:id]}")
    if @comment
      @replies = Reply.all.where("comment_id = #{@comment.id}")
    end
    
	end

  	def new
    	@errand = Errand.new
	  end

  def create
    if is_valid_date
      @errand = Errand.new(post_params(:category_id, :user_id, :description, :due_date))
        @errand.due_date = Time.strptime(params[:errand][:due_date], "%m/%d/%Y")
        @errand.user_id = session[:current_user_id]
        if @errand.valid?
          @errand.save
          redirect_to '/errands.1'
        else
        flash[:error] = @errand.errors.full_messages
          redirect_to new_errand_path
        end
    else
      redirect_to new_errand_path
    end
   end

	def edit
		
  end
  
  def update
  if is_valid_date
      @errand.update(post_params(:category_id, :description, :due_date))
      @errand.due_date = Time.strptime(params[:errand][:due_date], "%m/%d/%Y")
      if @errand.valid?
        @errand.save
        redirect_to '/errands.1'
      else
        flash[:error] = @errand.errors.full_messages
        redirect_to "/errands/#{params[:id]}/edit"
      end
    else
      redirect_to "/errands/#{params[:id]}/edit"
    end
	end

	def editpickup
	end

	def destroy
		@errand = Errand.find(params[:id])
		@errand.destroy
		redirect_to '/errands.1'
	end

	def pickup
		@errand = Errand.find(params[:errand_id])
		@errand.runner_user_id = session[:current_user_id]
		@errand.save
		if @errand.valid?
			redirect_to '/errands'
		else
			render :edit
		end
	end

	private

	def find_by_id
		@errand = Errand.find(params[:id])	
	end

	def find_by_id_for_pickup
		@errand = Errand.where("errands.id = #{params[:errand_id]}").joins(:category, :user).select('errands.*, categories.category, users.*')
	end

	def post_params(*args)
		params.require(:errand).permit(args)
  end

  def is_valid_date
    is_valid = true
    if ((Time.strptime(params[:errand][:due_date], "%m/%d/%Y") rescue ArgumentError) == ArgumentError) == true
      flash[:error] = "Invalid due date"
      is_valid = false
    else
      due_date = Time.strptime(params[:errand][:due_date], "%m/%d/%Y")
      if !due_date.future?
        flash[:error] = "Due date cannot be in the past"
        is_valid = false
      end
    end
    is_valid
  end
end