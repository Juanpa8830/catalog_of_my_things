require 'securerandom'


class Author
  attr_accessor :first_name, :last_name, :items, :id

  def initialize(first_name, last_name, id)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.author = self
  end

  def self.list_all_authors
    ObjectSpace.each_object(self).to_a
  end

  def self.by_id(id)
    list_all_authors.find { |author| author.id == id }
  end
end
