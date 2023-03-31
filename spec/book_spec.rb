require_relative '../classes/book'

describe Book do
  before :each do
    @genre_uno = Genre.new(1, 'terror')
    label_uno = Label.new('new', 'blue', 1)
    author_uno = Author.new('Steven', 'Spielberg', 1)
    @book = Book.new(@genre_uno, author_uno, label_uno, '2020-04-05', 'sony', 'bad')
  end

  context 'testing methods' do
    it 'Makes a new object' do
      expect(@book).to be_instance_of(Book)
    end

    it '#the genre of @book should be "terror"' do
      expect(@book.genre).to eql @genre_uno
    end
    it '#can_be_archived should return false' do
      @book.cover_state = 'good'
      expect(@book.can_be_archived?).to eq false
    end

    it '#can_be_archived should return true if cover_state=="bad"' do
      expect(@book.can_be_archived?).to eq true
    end
  end
end
