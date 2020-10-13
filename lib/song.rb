require 'pry'

class Song
  
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_new = Song.new
    @@all << new_new
    return new_new
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
   self.all.find {|i| i.name == name}
  end

  def self.find_or_create_by_name(string)
    self.find_by_name(string) || self.create_by_name(string)
  end

  def self.alphabetical
    self.all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(string)
    song = self.new
    song.name = string.split(" - ")[1].split(".")[0]
    song.artist_name = string.split(" - ")[0]
    song
  end

  def self.create_from_filename(string)
    new_song = self.new_from_filename(string)
    @@all << new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
