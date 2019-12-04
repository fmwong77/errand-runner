class RepliesController < ApplicationController
    before_action :find_by_id, only: [:update, :create]

    def new
      @reply = Reply.new
      @comment = Comment.find(params[:comment_id])
      # redirect_to 'errands/comments/new'
  end

    def create
        @reply = Reply.new(post_params(:content))
        @reply.comment_id = params[:comment_id]

        if @reply.valid?
            @reply.save
            redirect_to '/errands.1'
        else
            flash[:error] = @reply.errors.full_messages
            # redirect_to "/comments/#{@comment.id}/replies/new"
            byebug
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

    private
    def find_by_id
        @reply = Comment.find(params[:comment_id])
    end

    def post_params(*args)
        params.require(:reply).permit(args)
    end
end
