class ErrandsController < ApplicationController
    before_action :find_by_id, only: [:show, :edit, :update]
	def index
		# byebug
		case params[:format].to_i
		when 0
			@errands = Errand.where("user_id <> #{session[:current_user_id]}").joins(:category, :user).select('errands.*, categories.category, users.*')
		when 1
			@errands = Errand.where("user_id = #{session[:current_user_id]}").joins(:category, :user).select('errands.*, categories.category, users.*')
		when 2
			@errands = Errand.where("runner_user_id = #{session[:current_user_id]}").joins(:category, :user).select('errands.*, categories.category, users.*')
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

	def update
	end

	private

	def post_params(*args)
		params.require(:errand).permit(args)
  end
  
  def find_by_id
    @errand = Errand.find(params[:id])
  end
end