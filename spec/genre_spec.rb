require_relative 'item'
require_relative 'music_album'
require_relative 'genre'

describe Genre do
  let(:genre) { Genre.new(1, "Rock") }
  let(:music_album) { MusicAlbum.new(1, "Rock", "The Beatles", "CD", "Apple Records", "1968-11-22", true, true) }

  describe "#add_item" do
    it "adds the item to the genre's items" do
      genre.add_item(music_album)
      expect(genre.items).to include(music_album)
    end

    it "sets the item's genre to the genre instance" do
      genre.add_item(music_album)
      expect(music_album.genre).to eq(genre)
    end
  end

  describe ".list_all_genres" do
    it "returns an array of all genre names" do
      genre1 = Genre.new(2, "Pop")
      genre2 = Genre.new(3, "Jazz")
      expect(Genre.list_all_genres).to contain_exactly("Rock", "Pop", "Jazz")
    end
  end

  describe ".list_all_music_albums" do
    it "returns an array of all music albums in all genres" do
      genre1 = Genre.new(2, "Pop")
      album1 = genre.add_music_album(1, "The Beatles", "CD", "Apple Records", "1968-11-22", true, true)
      album2 = genre1.add_music_album(2, "Michael Jackson", "Vinyl", "Epic Records", "1982-11-30", true, true)
      expect(Genre.list_all_music_albums).to contain_exactly(album1, album2)
    end
  end

  describe "#add_music_album" do
    it "adds a new music album to the genre's items" do
      genre.add_music_album(1, "The Beatles", "CD", "Apple Records", "1968-11-22", true, true)
      expect(genre.items.count).to eq(1)
      expect(genre.items.first.author).to eq("The Beatles")
    end
  end
end
