class UsersController < ApplicationController
    before_action :find_by_id, only: [:show, :edit, :update]
    
	def index
		if authenticated
			redirect_to @user
		end
	end

	def show
	end

  def new
    @user = User.new
	end

  def create
    @user = User.new(allowed_params)
    if @user.valid?
       @user.save
       redirect_to '/login'
    else
      render :new
    end
	end

	def edit

	end

	def update
		@user.update(post_params(:first_name, :last_name, :password))
		if @user.valid?
			@user.save
			redirect_to @user
		else
			render :edit
		end
	end

  private
  
  def allowed_params
    params.require(:user).permit(:user_name, :password, :first_name, :last_name)
  end

	def post_params(*args)
		params.require(:user).permit(args)
    end
    
    def find_by_id
        @user = User.find(params[:id])
	end
	
	def authenticated
		@user = User.find_by(user_name: params[:user_name])
		if @user
			if @user.password == params[:password]
				true
			else
				false
			end
		else
			false
		end
	end
end