module Api
  module V1
    class LikesController < ApplicationController
      def create
        @like = Like.new(like_params)

        if @like.save
          render json: { status: 'SUCCESS', message: 'Like saved', like: LikeSerializer.new(@like) }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Failed to save like', data: @like.errors },
                 status: 422
        end
      end

      private

      def like_params
        params.require(:like).permit(:customer_email, :movie_id)
      end
    end
  end
end
