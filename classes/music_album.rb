require_relative 'item'
require 'json'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(*args, on_spotify)
    super(*args)
    @on_spotify = on_spotify
    save_to_file
  end

  def can_be_archived?
    super && @on_spotify
  end

  def save_to_file
    file_path = "data/music_album_data.json"
    data = JSON.parse(File.read(file_path)) rescue []
    data << { id: @id, genre: @genre, author: @author, 
              source: @source, label: @label, 
              publish_date: @publish_date, archived: @archived, 
              on_spotify: @on_spotify }
    File.write(file_path, JSON.pretty_generate(data))
  end
end
