class BooksController < ApplicationController
  def index
    if params[:query].present?
      @books = Book.where("title LIKE ? OR author LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end
end
