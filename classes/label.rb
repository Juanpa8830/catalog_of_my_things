require 'securerandom'


class Label
  attr_accessor :title, :color

  def initialize(title, _color)
    @id = SecureRandom.uuid
    @title = title
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
  end
end
