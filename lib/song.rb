#require 'pry'
class Song
extend Concerns::Findable
attr_accessor :name , :artist, :genre
@@all = []   

def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
end


def self.all
    @@all
end

def save
    self.class.all << self
end

def self.destroy_all
    @@all.clear 
end

def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap {|a| a.save}
    # song = Song.new
    # song.save
    # song
end


def self.new_from_filename(file_name)    
arr = file_name.split(" - ")
artist_name, song_name, genre_name = arr.first, arr.[1], arr.[2].gsub(".mp3", "")
artist = Artist.find_or_create_by_name(artist_name)
genre = Genre.find_or_create_by_name(genre_name)
self.new(song_name, genre)
end

def artist=(artist)
    @artist = artist
    artist.add_song(self)  
end

def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)   
end


end