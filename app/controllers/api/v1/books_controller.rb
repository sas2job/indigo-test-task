class Api::V1::BooksController < ApplicationController
  def index
    
    @books = BooksBlueprint.render Book.all, view: :normal
    render json: @books

  end
end
