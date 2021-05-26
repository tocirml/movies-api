module Api
  module V1
    class SalesController < ApplicationController
      def create
        @sale = Sale.new(sale_params)

        if @sale.save
          render json: { status: 'SUCCESS', message: 'Sale saved', sale: SaleSerializer.new(@sale) }, status: 201
        else
          render json: { status: 'ERROR', message: 'Failed to save sale', data: @sale.errors },
                 status: 422
        end
      end

      private

      def sale_params
        params.require(:sale).permit(:customer_email, :movie_id)
      end
    end
  end
end
