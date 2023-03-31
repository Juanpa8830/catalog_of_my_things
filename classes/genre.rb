require 'json'

class Genre
  attr_accessor :id, :name, :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self
  end

  def self.list_all_genres
    ObjectSpace.each_object(self).to_a
  end

  def self.by_id(id)
    list_all_genres.find { |genre| genre.id == id }
  end
end
