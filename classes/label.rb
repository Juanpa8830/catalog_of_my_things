require 'securerandom'


class Label
  attr_accessor :title, :color, :items, :id

  def initialize(title, color, id)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.label = self
  end

  def self.list_all_labels
    ObjectSpace.each_object(self).to_a
  end

  def self.by_id(id)
    list_all_labels.find { |label| label.id == id }
  end
end
