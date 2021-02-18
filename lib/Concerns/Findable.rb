module Findable
 
    def find_by_name(name)
        self.all.detect {|el| el.name == name}
    end
    
    def find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    #    item = @@all.detect{|el| el.name == name}
    #    if el == nil
    #    self.create(name) 
    #    else
    #    el
    #    end

        # if self.find_by_name(name) == nil
        #     self.create(name)
        # else
        #     self.find_by_name(name)
        # end
    end



end