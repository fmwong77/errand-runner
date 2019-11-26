class ErrandsController < ApplicationController
    # before_action :
    def index
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