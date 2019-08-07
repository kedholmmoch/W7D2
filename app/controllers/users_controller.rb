class UsersController < ApplicationController
    before_action :require_current_user!, except: [:create, :new]
    # before_action :require_access, only: [:show]

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:notice] = 'New user successfully created'
            login!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def new
        @user = User.new
        render 'new'
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

    # def require_access
    #     if params[:id] != current_user.id
    #         flash.now[:errors] = ["You don't have access to that page!"]
    #         redirect_to user_url(current_user)
    #     end
    # end
end
