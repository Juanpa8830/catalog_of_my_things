require_relative '../classes/genre'
require_relative '../classes/author'
require_relative '../classes/label'
require_relative '../classes/item'


describe Author do
  context 'When testing the Author class' do
    it "should create an object instance of the class Author with first_name = 'Carlos, last_name = 'Baute'" do
      author = Author.new('Carlos', 'Baute')
      expect(author).to be_instance_of(Author)
      expect(author.first_name).to eq 'Carlos'
      expect(author.last_name).to eq 'Baute'
    end
  end

  context 'When testing the add_item method in class Author' do
    it 'should add an item object to the @items array in Author class' do
      genre = Genre.new(3, 'drama')
      author = Author.new('Carlos', 'Baute')
      label = Label.new('refurbished', 'red')
      item = Item.new(genre, author, label, '2020-05-04')
      author.add_item(item)
      expect(author.items.size).to eq 1
    end
  end
end
