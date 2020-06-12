module Api
  module V1
    class BooksController < ApplicationController

      def create
        @book = Book.new(book_params)

        if @book.save
          render json: {
            status: 'SUCCESS',
            message: 'Book created',
            data: @book
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'Book creation failed',
            data: @book.errors
          }, status: :unprocessable_entity
        end
      end

      def index
        @books = Book.all

        render json: {
          status: 'SUCCESS',
          message: 'Loaded books',
          data: @books
        }, status: :ok
      end

      def show
        @book = Book.find(params[:id])

        render json: {
          status: 'SUCCESS',
          message: 'Loaded book',
          data: @book
        }, status: :ok
      end

      private

        def book_params
          params.permit(:title, :category)
        end
    end
  end
end