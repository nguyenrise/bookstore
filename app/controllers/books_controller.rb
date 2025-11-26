class BooksController < ApplicationController
  def index
    @books = Book.all
    if params[:query].present?
      @books = @books.where("title LIKE ? OR author LIKE ? OR description LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    if params[:category_id].present?
      @books = @books.joins(:categories).where(categories: { id: params[:category_id] })
    end

    if params[:filter] == "new"
      @books = @books.newly_added
    elsif params[:filter] == "recently_updated"
      @books = @books.recently_updated
    end

    @books = @books.page(params[:page]).per(8)
  end

  def show
    @book = Book.find(params[:id])
  end
end
