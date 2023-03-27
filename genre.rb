class Genre
  attr_accessor :id, :name, :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
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

  def add_music_album(id, author, source, label, publish_date, archived, on_spotify)
    album = MusicAlbum.new(id, @name, author, source, label, publish_date, archived, on_spotify)
    add_item(album)
  end
end

