require 'securerandom'
require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(*args, multiplayer, last_played_at)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def self.list_all_games
    ObjectSpace.each_object(self).to_a.each_with_index do |game, i|
      puts "\n[#{i + 1}]. game_id: #{game.id} game_genre: #{game.genre.name} multiplayer: #{game.multiplayer}"
    end
  end

  def can_be_archived?
    super && ((Date.today.year - @last_played_at.year) > 2)
  end

  def self.all_games
    ObjectSpace.each_object(self).to_a
  end

  def to_json(*_args)
    {
      genre_id: @genre.id,
      author_id: @author.id,
      label_id: @label.id,
      publish_date: @publish,
      id: @id,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    }.to_json
  end
end
