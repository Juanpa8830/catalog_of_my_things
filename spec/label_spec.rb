require_relative '../classes/genre'
require_relative '../classes/author'
require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  context 'When testing the Label class' do
    it "should create an object instance of the class Label with title = 'new', color = 'blue'" do
      label = Label.new('New', 'Blue', 1)
      expect(label).to be_instance_of(Label)
      expect(label.title).to eq 'New'
      expect(label.color).to eq 'Blue'
    end
  end

  context 'When testing the add_item method in class Label' do
    it 'should add an item object to the @items array in Label class' do
      genre = Genre.new(1, 'horror')
      author = Author.new('R.L', 'Stine', 1)
      label = Label.new('New', 'Blue', 1)
      item = Item.new(genre, author, label, '2020-05-04')
      label.add_item(item)
      expect(label.items.size).to eq 1
    end
  end
end
