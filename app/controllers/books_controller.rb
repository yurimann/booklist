class BooksController < ApplicationController

  def index
    @books = Book.all


    respond_to do|format|
      format.html
      format.text

      format.csv do
        csv_book = Book.generate_csv(@books)
        render plain: csv_book
      end

      format.json do
        json_book = @books.map do |book|
          {title: book.title,
          author: book.author,
          read: book.already_read,}
        end
        render json: json_book
      end
    end
  end

end
