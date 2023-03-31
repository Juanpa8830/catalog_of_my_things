require 'securerandom'
require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(*args, publisher, cover_state)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.list_all_books
    ObjectSpace.each_object(self).to_a.each_with_index do |book, i|
      puts "\n[#{i + 1}]. book_author: #{"#{book.author.first_name} #{book.author.last_name}"}"
    end
  end

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end

  def self.all_books
    ObjectSpace.each_object(self).to_a
  end

  def to_json(*_args)
    {
      genre_id: @genre.id,
      author_id: @author.id,
      label_id: @label.id,
      publish_date: @publish,
      id: @id,
      publisher: @publisher,
      cover_state: @cover_state
    }.to_json
  end
end
