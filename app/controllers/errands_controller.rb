class ErrandsController < ApplicationController
    # before_action :
	def index
		@errands = Errand.all
		# redirect_to errands_path
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
end