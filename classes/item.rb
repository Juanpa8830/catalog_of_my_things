require 'securerandom'
require_relative 'label'

class Item
  def initialize(genre, author, label, publish, archived: false)
    @id = SecureRandom.uuid

    @genre = genre
    @author = author

    @label = label
    @label.add_item(self)
    
    @publish = publish
    @archived = archived
  end

  def can_be_archived?
    return false unless publish < '2013-01-01'

    true
  end

  def move_to__archive
    return unless can_be_archived?

    @archived = true
  end
end
