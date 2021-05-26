module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: %i[edit update destroy]
      before_action :set_sort_criteria, only: %i[index]

      def index
        @movies = Movie.available(params[:unavailable].eql?('true') || false)
                       .filter_by_title(params[:title] || '')
                       .paginate(page: params[:page] || 1, per_page: params[:size] || 12)
                       .order(@sort_criteria)

        render json: { content: MovieSerializer.new(@movies),
                       size: params[:size].to_i,
                       number_of_elements: @movies.size,
                       total_elements: @movies.count,
                       total_pages: @movies.total_pages,
                       number: params[:page].to_i }, status: :ok
      end

      def create
        @movie = Movie.new(movie_params)

        if @movie.save
          render json: { status: 'SUCCESS', message: 'Movie saved', movie: MovieSerializer.new(@movie) },
                 status: 201
        else
          render json: { status: 'ERROR', message: 'Failed to save movie', data: @movie.errors.messages },
                 status: 422
        end
      end

      def update
        return render json: { status: 'ERROR', message: 'Movie not found' }, status: 404 if @movie.nil?

        if @movie.update(movie_params)
          render json: { status: 'SUCCESS', message: 'Movie saved', movie: MovieSerializer.new(@movie) },
                 status: :ok
        else
          render json: { status: 'ERROR', message: 'Failed to update the movie', data: @movie.errors.messages },
                 status: 422
        end
      end

      def destroy
        if !@movie.nil?
          @movie.destroy
          render json: { status: 'SUCCESS', message: 'Movie deleted', movie: MovieSerializer.new(@movie) }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Movie not found' }, status: 404
        end
      end

      private

      def set_movie
        @movie = Movie.find_by(id: params[:id])
      end

      def movie_params
        params.require(:movie).permit(:title, :description, :rental_price, :stock, :sale_price, :available)
      end

      def set_sort_criteria
        @sort_criteria = 'title asc'
        return if params[:sort].nil?

        sort_by = params[:sort].split(',')
        @sort_criteria = "#{sort_by[0]} #{sort_by[1]}" if validate_sort_criteria(sort_by[0],
                                                                                 sort_by[1]) && sort_by.length.eql?(2)
      end

      def validate_sort_criteria(attribute, order)
        # whilelist of for sort param
        attribute.match(/^(title|description|stock|rental_price|sale_price|available)$/) && order.match(/^(asc|desc)$/)
      end
    end
  end
end
