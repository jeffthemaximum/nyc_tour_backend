module Api
  module V1
    class UsersController < ApiController
      skip_before_action :verify_authorized, :only => [:create]

      def create
        @user = User.new(user_params)

        unless(@user.save)
          return render json: {errors: @user.errors}, status: 422
        end

        render json: @user, serializer: UserSerializer, status: :ok
      end

      def show
        # TODO
        head :ok
      end

      private
        def user_params
          params.permit(:email, :password, :password_confirmation)
        end
    end
  end
end
