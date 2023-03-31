require 'securerandom'
require_relative 'label'

class Item
  attr_accessor :genre, :author, :label, :publish, :id, :archived

  def initialize(genre, author, label, publish, id = SecureRandom.uuid)
    @id = id

    @genre = genre
    genre.add_item(self)

    @author = author
    author.add_item(self)

    @label = label
    label.add_item(self)

    @publish = Date.parse(publish)

    @archived = false
  end

  def can_be_archived?
    (Date.today - @publish).to_f / 365 > 10
  end

  def move_to__archive
    return unless can_be_archived?

    @archived = true
  end
end
