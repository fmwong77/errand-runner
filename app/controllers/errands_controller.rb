class ErrandsController < ApplicationController

	before_action :find_by_id, only: [:edit, :show]
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
		byebug
	end

	  def show
		@comment = Comment.find_by("errand_id = #{params[:id]}")
	end

  	def new
    	@errand = Errand.new
	end

  def create
    @errand = Errand.new(:category_id, :user_id, :runner_user_id, :description, :due_date)
    @errand.save
    redirect_to errands_path
	end

	def edit
		
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
end