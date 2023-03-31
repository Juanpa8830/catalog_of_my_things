require_relative '../classes/genre'
require_relative '../classes/author'
require_relative '../classes/label'
require_relative '../classes/item'
require 'date'

describe Item do
  genre = Genre.new(1, 'comedy')
  author = Author.new('Nino', 'Bravo')
  label = Label.new('new', 'blue')
  item = Item.new(genre, author, label, '2008-05-03')

  context 'When testing Item Class' do
    it 'should create an object from Item class' do
      expect(item).to be_instance_of(Item)
    end
  end

  context 'When testing can_be_archived' do
    it 'should return true if publish date > 10 years' do
      expect(item.can_be_archived?).to eq true
    end
  end

  context 'When testing can_be_archived' do
    it 'should return false if publish date < 10 years' do
      item.publish = Date.parse('2016-09-27')
      expect(item.can_be_archived?).to eq false
    end
  end

  # context 'When testing the to_json method in class Rental' do
  #  it 'should create an JSON file of a hash created with a Rental attribute ' do
  #    expected_json =
  #      '{"date":"2020/05/21","book_title":"Hello World","person_id":"f20f4d7c-f3ac-48e4-a4e6-098e4acf5ae8"}'
  #    rental_to_json = rental.to_json
  #    expect(rental_to_json).to eq expected_json
  #  end
  # end
end
