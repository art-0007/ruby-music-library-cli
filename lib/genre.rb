class Genre
extend Concerns::Findable
attr_accessor :name , :songs
@@all = []

    def initialize(name)
        @name = name
        @songs = []
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

    def self.create(name)
        new(name).tap {|a| a.save}
        # genre = Genre.new(name)
        # genre.save
        # genre
    end

    def artists
        self.songs.collect{|s| s.artist}.uniq   
    end

    # def to_s
    #     self.name   
    # end
end