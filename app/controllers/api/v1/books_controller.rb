class Api::V1::BooksController < ApplicationController
  def index
    @books = Book.all
    render json: BooksBlueprint.render(@books, view: :normal), status: 200
  end

  def show
    @book = Book.find(params[:id])
    render json: BooksBlueprint.render(@book, view: :normal)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book
    else
      render error: { error: 'Unable to create Book.' }
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book
      @book.update(book_params)
      render json: { message: 'Book successfully updated.' }
    else
      render json: { error: 'Unable to update Book.'}
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book
      @book.destroy
      render json: { message: 'Book successfully deleted.' }
    else
      render json: { error: 'Unable to delete Book.'}
    end        
  end

  private

  def book_params
    params.permit(:name, :author)
  end
end
