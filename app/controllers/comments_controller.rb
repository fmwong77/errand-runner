class CommentsController < ApplicationController
    before_action :find_by_id, only: [:update]
    
    def new
        @comment = Comment.new
        @errand = Errand.find(params[:errand_id])
        @user = User.find(@errand.user_id)
    end

    def create
        @comment = Comment.new(post_params(:content, :rating, :errand_id))
        @comment.errand_id = params[:errand_id]

        if @comment.valid?
            @comment.save
            redirect_to '/errands.1'
        else
            flash[:error] = @comment.errors.full_messages
            redirect_to new_errand_comment_path
        end
    end

    def update
		@comment.update(post_params(:content, :rating))
		if @comment.valid?
			@comment.save
			redirect_to 'errands.1'
		else
			flash[:error] = @comment.errors.full_messages
			redirect_to "/comments/#{@comment.id}/edit"
		end
	end

    private
    def find_by_id
        @comment = Comment.find(params[:id])
    end

    def post_params(*args)
        params.require(:comment).permit(args)
    end
end
