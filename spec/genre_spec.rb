require_relative '../classes/genre'
require_relative '../classes/author'
require_relative '../classes/label'
require_relative '../classes/item'


describe Genre do
  context 'When testing the Genre class' do
    it "should create an object instance of the class Genre with id = '1', name = 'comedy'" do
      genre = Genre.new(1, 'comedy')
      expect(genre).to be_instance_of(Genre)
      expect(genre.id).to eq 1
      expect(genre.name).to eq 'comedy'
    end
  end

  context 'When testing the add_item method in class Genre' do
    it 'should add an item object to the @items array in Genre class' do
      genre = Genre.new(2, 'horror')
      author = Author.new('Carlos', 'Baute')
      label = Label.new('Used', 'red')
      item = Item.new(genre, author, label, '2020-05-04')
      genre.add_item(item)
      expect(genre.items.size).to eq 1
    end
  end
end
