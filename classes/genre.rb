require 'json'

class Genre
  attr_accessor :id, :name, :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
    save_to_file
  end

  def add_item(item)
    @items << item
    item.genre = self
    save_to_file
  end

  def self.list_all_genres
    genres = []
    ObjectSpace.each_object(self) do |genre|
      genres << genre.name
    end
    genres
  end

  def self.list_all_music_albums
    albums = []
    ObjectSpace.each_object(self) do |genre|
      genre.items.each do |item|
        albums << item if item.is_a?(MusicAlbum)
      end
    end
    albums
  end

  def add_music_album(id, author, label, publish_date, archived, on_spotify)
    album = MusicAlbum.new(id, @name, author, label, publish_date, archived, on_spotify)
    add_item(album)
  end

  def save_to_file
    file_path = "data/genre_data.json"
    data = JSON.parse(File.read(file_path)) rescue []
    genre_data = { id: @id, name: @name, items: @items.map(&:to_h) }
    existing_genre_data = data.find { |d| d["id"] == @id }
    if existing_genre_data
      existing_genre_data.update(genre_data)
    else
      data << genre_data
    end
    File.write(file_path, JSON.pretty_generate(data))
  end
end
