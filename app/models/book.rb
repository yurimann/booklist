# There's an object in the Ruby standard library for manipulating CSV data
# It's not included by default when Rails starts, so we'll require it here.
require 'csv'

class Book < ActiveRecord::Base
  # This method is used to create a CSV representation of the data in the database
  def self.generate_csv(book_list)
    header = ['id', 'title', 'author', 'already_read']

    CSV.generate(headers: true) do |csv|
      csv << header

      book_list.each do |book|
        csv << [book.id, book.title, book.author, book.already_read]
      end
    end
  end
end
