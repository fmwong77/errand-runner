class ErrandsController < ApplicationController
	before_action :find_by_id, only: [:edit]
	before_action :find_by_id_for_pickup, only: [:editpickup]
	
	def index
		# byebug
		case params[:format].to_i
		when 0
			@errands = Errand.where("user_id <> #{session[:current_user_id]} and runner_user_id isnull").joins(:category, :user).select('errands.*, categories.category, users.*')
		when 1
			@errands = Errand.where("user_id = #{session[:current_user_id]}").joins(:category, :user).select('errands.*, categories.category, users.*')
		when 2
			@errands = Errand.where("runner_user_id = #{session[:current_user_id]}").joins(:category, :user).select('errands.*, categories.category, users.*')
		else
			@errands = Errand.where("user_id <> #{session[:current_user_id]} and runner_user_id isnull").joins(:category, :user).select('errands.*, categories.category, users.*')
		end
	end

	def show
	end

  def new
    @errand = Errand.new
	end

  def create
    @errand = Errand.new(:category_id, :user_id, :runner_user_id, :description, :due_date)
    redirect_to errands_path
	end

	def edit
		
	end

	def editpickup
	end

	def pickup
		# byebug
		@errand = Errand.find(params[:errand_id])
		@errand.runner_user_id = session[:current_user_id]
		# @errand.update(post_params(:runner_user_id))
		# byebug
		@errand.save
		if @errand.valid?
			# byebug
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