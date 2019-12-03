class StaticController < ApplicationController
    def login
        @user = User.new
    end
end