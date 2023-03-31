require_relative '../classes/music_album'


describe MusicAlbum do
  before :each do
    genre_uno = Genre.new(1, 'terror')
    label_uno = Label.new('new', 'blue')
    @author_uno = Author.new('Steven', 'Spielberg')
    @album = MusicAlbum.new(genre_uno, @author_uno, label_uno, '2020-04-05', 'yes')
  end

  context 'testing methods' do
    it 'Makes a new object' do
      expect(@album).to be_instance_of(MusicAlbum)
    end

    it '#the author of @album should be "steven"' do
      expect(@album.author).to eql @author_uno
    end

    it '#can_be_archived should return false if on_spotify = "no"' do
      @album.on_spotify = 'no'
      expect(@album.can_be_archived?).to eq false
    end
  end
end
