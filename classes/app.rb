require_relative 'book'
require_relative 'music_album'
require_relative 'game'
require_relative 'genre'
require_relative 'label'
require_relative 'author'
require_relative 'modules'
require 'json'

class App
  def initialize
    set_data
    load_data
  end

  include ExtraMethods

  MENU = {
    1 => 'call_books',
    2 => 'call_albums',
    3 => 'call_games',
    4 => 'list_genres',
    5 => 'list_labels',
    6 => 'list_authors',
    7 => 'create_book',
    8 => 'create_album',
    9 => 'create_game'
  }.freeze

  def start
    loop do
      option = selected_menu_option
      break if option == 10

      send((MENU[option]).to_s)
      wait_user
    end
  end

  def wait_user
    puts 'Press any key to continue...'
    gets.chomp
    puts ''
  end

  def call_books
    Book.list_all_books
  end

  def call_albums
    MusicAlbum.list_all_albums
  end

  def call_games
    Game.list_all_games
  end

  def set_data
    Genre.new(1, 'terror')
    Genre.new(2, 'novela')
    Genre.new(3, 'comedia')
    Label.new('new', 'blue', 1)
    Label.new('used', 'yellow', 2)
    Label.new('refurbished', 'green', 3)
    Author.new('Steven', 'Spielberg', 1)
    Author.new('Mauricio', 'Morales', 2)
    Author.new('Pedro', 'Infante', 3)
  end

  def list_labels
    Label.list_all_labels.each_with_index do |label, i|
      puts "\n[#{i + 1}]. title:#{label.title} color:#{label.color}"
    end
  end

  def list_genres
    Genre.list_all_genres.each_with_index do |genre, i|
      puts "\n[#{i + 1}]. #{genre.name} "
    end
  end

  def list_authors
    Author.list_all_authors.each_with_index do |author, i|
      puts "\n[#{i + 1}]. #{"#{author.first_name} #{author.last_name}"}"
    end
  end

  def create_book
    puts "\nInput the book data:"
    selected_genre = obtain_genre
    selected_author = obtain_author
    selected_label = obtain_label
    print "\ninput publish_date in a valid format [yyyy-mm-dd]: "
    publish = gets.chomp
    print "\ninput publisher: "
    publisher = gets.chomp
    print "\ninput cover_state: "
    cover_state = gets.chomp

    Book.new(selected_genre, selected_author, selected_label, publish, publisher, cover_state)
    puts "\nBook created successfully.\n"
  end

  def create_game
    puts "\nInput the game data:"
    selected_genre = obtain_genre
    selected_author = obtain_author
    selected_label = obtain_label
    print "\ninput publish date valid format [yyyy-mm-dd]: "
    publish = gets.chomp
    print "\ninput multiplayer: "
    multiplayer = gets.chomp
    print "\ninput last_played_at with a valid format [yyyy-mm-dd]: "
    last_played_at = gets.chomp
    Game.new(selected_genre, selected_author, selected_label, publish, multiplayer, last_played_at)
    puts "\nGame created successfully.\n"
  end

  def create_album
    puts "\nInput the album data:"
    selected_genre = obtain_genre
    selected_author = obtain_author
    selected_label = obtain_label
    print "\ninput publish_date valid format [yyyy-mm-dd]: "
    publish = gets.chomp
    print "\ninput on spotify?: "
    on_spotify = gets.chomp

    MusicAlbum.new(selected_genre, selected_author, selected_label, publish, on_spotify)
    puts "\nalbum created successfully.\n"
  end

  def obtain_genre
    puts "\nselect a genre from the following list, by number:"
    Genre.list_all_genres.each_with_index do |gen, i|
      puts "\n[#{i + 1}]. #{gen.name}"
    end
    gen_number = get_option_selected(1, Genre.list_all_genres.length)
    Genre.list_all_genres[gen_number - 1]
  end

  def obtain_author
    puts "\nselect an Author from the following list, by number:"
    Author.list_all_authors.each_with_index do |author, i|
      puts "\n[#{i + 1}]. #{"#{author.first_name} #{author.last_name}"}"
    end
    author_number = get_option_selected(1, Author.list_all_authors.length)
    Author.list_all_authors[author_number - 1]
  end

  def obtain_label
    puts "\nselect a label from the following list, by number:"
    Label.list_all_labels.each_with_index do |label, i|
      puts "\n[#{i + 1}]. title: #{label.title}  color: #{label.color}"
    end
    label_number = get_option_selected(1, Label.list_all_labels.length)
    Label.list_all_labels[label_number - 1]
  end

  def get_option_selected(first, last)
    option = ''
    loop do
      option = gets.chomp.to_i
      break if option >= first && option <= last

      print 'select a valid option '
    end
    option
  end
end
