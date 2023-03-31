require_relative '../classes/game'


describe Game do
  before :each do
    genre_uno = Genre.new(1, 'terror')
    @label_uno = Label.new('new', 'blue')
    author_uno = Author.new('Steven', 'Spielberg')
    @game = Game.new(genre_uno, author_uno, @label_uno, '2008-04-05', '3', '2022-05-07')
  end

  context 'testing methods' do
    it 'Makes a new object' do
      expect(@game).to be_instance_of(Game)
    end

    it '#the label of @game should be "new"' do
      expect(@game.label).to eql @label_uno
    end

    it '#can_be_archived should return false if last_played_at > "2021-01-01"' do
      expect(@game.can_be_archived?).to eq false
    end

    it '#can_be_archived should return true if last_played_at < "2021-01-01"' do
      @game.last_played_at = Date.parse('2018-04-06')
      expect(@game.can_be_archived?).to eq true
    end
  end
end
