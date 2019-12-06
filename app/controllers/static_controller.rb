class StaticController < ApplicationController
    def login
        @user = User.new
    end

    def goodbye
      # sleep 30
      # redirect_to "/"
    end
end