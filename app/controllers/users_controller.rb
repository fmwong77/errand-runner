class UsersController < ApplicationController
    before_action :find_by_id, only: [:show, :update]
    
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
		params.require(:user).permit(args)
    end
    
    def find_by_id
        @user = User.find(params[:id])
    end
end