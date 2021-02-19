class Artist
extend Concerns::Findable
extend Persistable::ClassMethods
include Persistable::InstanceMethods
attr_accessor :name, :songs
@@all = []

def initialize(name)
    @name = name
    @songs = []
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

def self.create(name)
    new(name).tap {|a| a.save}
end

def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self      
end

def genres
    self.songs.collect{|s| s.genre}.uniq   
end

end