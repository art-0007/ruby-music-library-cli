module Persistable
    module InstanceMethods
        def save
            self.class.all << self
        end
        
    end

    module ClassMethods
        def self.destroy_all
            @@all.clear 
        end 

        def self.all
            @@all   
        end
    end
    
end