require_relative 'book'
require 'json'


class App
  def initialize
    @books = []
    #@labels = []
 
    #load_data
  end
 # include ExtraMethods

  def books_list
    if @books.empty?
      puts 'Add a new book first'
    else
      list = ''
      @books.each_with_index do |book, i|
        list << "\n[#{i + 1}]. id:#{book.id} genre: #{book.genre.name}, author: #{book.author.first_name + book.author.last_name}"
      end
      list << "\n\n"
    end
  end

 

  def start
    loop do
      option = selected_menu_option
      case option
      when 1  then puts books_list 
      when 2 then puts albums_list 
      when 3 then puts games_list 
      when 4 then puts genres_list 
      when 5 then puts labels_list 
      when 6 then puts authors_list 
      when 7 then create_book
      when 8 then create_album
      when 9 then create_game
      else  break  end
      wait_user
    end
  end

  def wait_user
    puts 'Press any key to continue...'
    gets.chomp
    puts ''
  end

  def create_book
    puts "\nInput the book data:"
    print 'Input genre: '
    genre = gets.chomp
    print 'Input author: '
    author = gets.chomp
    print 'Input label: '
    label = gets.chomp
    print 'Input publish date: '
    publish = gets.chomp
    print 'Input publisher: '
    publisher = gets.chomp
    print 'Input cover_state: '
    cover_state = gets.chomp
    book = Book.new(genre, author, label, publish, publisher, cover_state)
    @books.push(book)
    puts "\nBook created successfully.\n"
  end

  def create_person
    puts "\Do you want to create a student (1) or a teacher (2)? type the number: "
    option = get_option_selected(1, 2)

    case option
    when 1
      add_student
    when 2
      add_teacher
    end
  end

  def create_rental
    if @books.empty? || @users.empty?
      puts 'your books list or users list is empty. plase add a book/user first'
    else
      puts "\nselect a book from the following list, by number:"
      puts books_list
      book_number = get_option_selected(1, @books.length)
      selected_book = @books[book_number - 1]
      puts "\nselect a person from the following list, by number:"
      puts users_list
      user_number = get_option_selected(1, @users.length)
      selected_user = @users[user_number - 1]
      puts "\ninsert the date of this rental:"
      date = gets.chomp
      rental = Rental.new(date, selected_book, selected_user)
      @rentals.push(rental) unless rental.nil?
      puts "\nrental created successfully.\n"
    end
  end

  def user_rentals
    print 'Input user id: '
    id = gets.chomp
    person = @users.find { |per| per.id == id }
    person.nil? ? "There isn't a person with that id\n" : person.rental_list
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

  def permission?
    print 'has parent permission? [Y/N]'
    answer = gets.chomp.capitalize
    return true unless answer == 'N'

    false
  end

  def add_student
    puts "\nInput the student data:"
    print 'Input student name: '
    name = gets.chomp
    print 'Input student age: '
    age = gets.chomp.to_i
    permiso = age >= 18 ? true : permission?
    person = Student.new(age, name, parent_permission: permiso)
    @users.push(person)
    puts "\nstudent created successfully.\n"
  end

  def add_teacher
    puts "\nInput the teacher data:"
    print 'Input teacher name: '
    name = gets.chomp
    print 'Input teacher age: '
    age = gets.chomp.to_i
    print 'Input teacher specialization: '
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name)
    @users.push(person)
    puts "\nteacher created successfully.\n"
  end
end
