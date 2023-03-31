require_relative 'item'
require 'json'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(*args, on_spotify)
    super(*args)
    @on_spotify = on_spotify
  end

  def self.list_all_albums
    ObjectSpace.each_object(self).to_a.each_with_index do |album, i|
      puts "\n[#{i + 1}]. album_id: #{album.id} album_genre: #{album.genre.name} on_spotify: #{album.on_spotify}"
    end
  end

  def can_be_archived?
    super && @on_spotify
  end

  def self.all_albums
    ObjectSpace.each_object(self).to_a
  end

  def to_json(*_args)
    {
      genre_id: @genre.id,
      author_id: @author.id,
      label_id: @label.id,
      publish_date: @publish,
      id: @id,
      on_spotify: @on_spotify
    }.to_json
  end
end
