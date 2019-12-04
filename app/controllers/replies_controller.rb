class RepliesController < ApplicationController
    before_action :find_by_id, only: [:update, :create]

    def new
        @reply = Comment.new
    end

    def create
        @reply = Comment.new(:content, :rating)

        if @reply.valid?
            @reply.save
            redirect_to 'errands.1'
        else
            flash[:error] = @user.errors.full_messages
            redirect_to '/replies/new'
        end
    end

    def update
		@reply.update(post_params(:content, :rating))
		if @reply.valid?
			@reply.save
			redirect_to 'errands.1'
		else
			flash[:error] = @reply.errors.full_messages
			redirect_to "/replies/#{@reply.id}/edit"
		end
  end
  
  def show
    
  end

    private
    def find_by_id
        @reply = Comment.find(params[:id])
    end

    def post_params(*args)
        params.require(:comment).permit(args)
    end
end
