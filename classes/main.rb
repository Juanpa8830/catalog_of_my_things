require_relative 'app'

def main
  app = App.new
  app.start
  app.save_data
  puts 'Thanks for using this catalogue!'
end

def selected_menu_option
  puts '@@@@@@@@@@@@@ CATALOG OF MY THINGS @@@@@@@@@@@@@@'
  puts "\nPlease choose an option by entering a number: "
  puts '1 - List all books.'
  puts '2 - List all music albums.'
  puts '3 - List all games.'
  puts '4 - List all genres.'
  puts '5 - List all labels.'
  puts '6 - List all authors.'
  puts '7 - Add a book.'
  puts '8 - Add a music album.'
  puts '9 - Add a game.'
  puts '10 - salida'

  get_option_selected(1, 10)
end

main
