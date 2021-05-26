module Api
  module V1
    class TransactionsController < ApplicationController
      before_action :set_movie, only: %i[index]

      def index
        @transactions = @movie.transactions.created_between(params[:from], params[:to]) unless @movie.nil?
        # @transactions = Transaction.created_between(params[:from], params[:to], params[:id])

        if @transactions.present?
          render json: { status: 'SUCCESS', transactions: TransactionSerializer.new(@transactions) },
                 status: 201
        else
          render json: { status: 'NOT FOUND', message: 'No transactions available for this data' },
                 status: 404
        end
      end

      private

      def set_movie
        @movie = Movie.find_by(id: params[:id])
      end
    end
  end
end
