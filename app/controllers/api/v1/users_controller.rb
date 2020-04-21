module Api
  module V1
    class UsersController < ApiController
      skip_before_action :verify_authorized, :only => [:create, :login]

      def create
        @user = User.new(user_params)

        unless(@user.save)
          return render json: {errors: @user.errors}, status: 422
        end

        render json: @user, serializer: UserSerializer, status: :ok
      end

      def login
        @user = User.find_by(email: user_params[:email].downcase)

        if @user && @user.authenticate(user_params[:password])
          render json: @user, serializer: UserSerializer, status: :ok
        else
          render json: {errors: @user.errors}, status: 422
        end
      end

      def show
        render json: @current_user, serializer: UserSerializer, status: :ok
      end

      private
        def user_params
          params.permit(:email, :password, :password_confirmation)
        end
    end
  end
end
