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
    end
  end

end
