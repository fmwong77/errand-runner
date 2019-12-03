class ErrandsController < ApplicationController
    # before_action :
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
	end

	def create
	end

	def edit
	end

	def update
	end

	private

	def post_params(*args)
		params.require(:errand).permit(args)
	end
end