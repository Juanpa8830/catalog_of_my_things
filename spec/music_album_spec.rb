# music_album_spec.rb

require_relative 'item'
require_relative 'music_album'

describe MusicAlbum do
  let(:music_album) { MusicAlbum.new(1, "Rock", "The Beatles", "CD", "Apple Records", "1968-11-22", true, true) }

  describe "#can_be_archived?" do
    context "when the music album is archived and on Spotify" do
      it "returns true" do
        expect(music_album.can_be_archived?).to eq(true)
      end
    end

    context "when the music album is not on Spotify" do
      it "returns false" do
        music_album.on_spotify = false
        expect(music_album.can_be_archived?).to eq(false)
      end
    end

    context "when the music album is not archived" do
      it "returns false" do
        music_album.archived = false
        expect(music_album.can_be_archived?).to eq(false)
      end
    end
  end
end
