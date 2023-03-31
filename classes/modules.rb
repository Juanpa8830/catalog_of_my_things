require_relative 'genre'
require_relative 'label'
require_relative 'author'


module ExtraMethods
  def save_data
    save_books
    save_albums
    save_games
  end

  def save_books
    File.open('info/books.json', 'w') { |f| f << Book.all_books.to_json }
  end

  def save_albums
    File.open('info/albums.json', 'w') { |f| f << MusicAlbum.all_albums.to_json }
  end

  def save_games
    File.open('info/games.json', 'w') { |f| f << Game.all_games.to_json }
  end

  def load_data
    load_books
    load_albums
    load_games
  end

  def load_books
    return unless File.exist?('info/books.json') && File.size?('info/books.json')

    information = JSON.parse(File.read('info/books.json'))
    information.map do |book|
      Book.new(
        Genre.by_id(book['genre_id']),
        Author.by_id(book['author_id']),
        Label.by_id(book['label_id']),
        book['publish_date'],
        book['id'],
        book['publisher'],
        book['cover_state']
      )
    end
  end

  def load_albums
    return unless File.exist?('info/albums.json') && File.size?('info/albums.json')

    information = JSON.parse(File.read('info/albums.json'))
    information.map do |album|
      MusicAlbum.new(
        Genre.by_id(album['genre_id']),
        Author.by_id(album['author_id']),
        Label.by_id(album['label_id']),
        album['publish_date'],
        album['id'],
        album['on_spotify']
      )
    end
  end

  def load_games
    return unless File.exist?('info/games.json') && File.size?('info/games.json')

    information = JSON.parse(File.read('info/games.json'))
    information.map do |game|
      Game.new(
        Genre.by_id(game['genre_id']),
        Author.by_id(game['author_id']),
        Label.by_id(game['label_id']),
        game['publish_date'],
        game['id'],
        game['multiplayer'],
        game['last_played_at']
      )
    end
  end
end
