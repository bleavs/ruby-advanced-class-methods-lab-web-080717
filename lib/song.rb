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
     song = self.new
     @@all << song
     song
  end

  def self.new_by_name(name)
    song =  self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    song = self.new

     arr_artist_song = file_name.split(" - ")
     artist=  arr_artist_song[0]

     tune =  arr_artist_song[1]
      tune  = tune.chomp(".mp3")

      song.name = tune
      song.artist_name = artist
      song
  end

 def self.create_from_filename(file_name)
   song = self.new_from_filename(file_name)
   song.save
 end

 def self.destroy_all
   self.all.clear
 end






end
