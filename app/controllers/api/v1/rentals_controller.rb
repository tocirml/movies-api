module Api
  module V1
    class RentalsController < ApplicationController
      def create
        @rental = Rental.new(rental_params)

        if @rental.save
          render json: { status: 'SUCCESS', message: 'Rental saved', rental: RentalSerializer.new(@rental) },
                 status: :ok
        else
          render json: { status: 'ERROR', message: 'Failed to save rental', data: @rental.errors },
                 status: 422
        end
      end

      private

      def rental_params
        params.require(:rental).permit(:customer_email, :movie_id)
      end
    end
  end
end
