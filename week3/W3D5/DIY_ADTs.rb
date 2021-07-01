class Stack
    def initialize
      # create ivar to store stack here!
      @ivar = []
    end

    def push(el)
      # adds an element to the stack
      @ivar.push(el)
    end

    def pop
      # removes one element from the stack
      @ivar.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @ivar
    end
end

class Queue
    def initialize
        @ivar = []
    end

    def enqueue(el)
        @ivar.push(el)
    end

    def pop
        @ivar.shift
    end

    def peek
        @ivar
    end
end

class Map
    def initialize
        @ivar = []
    end

    def set(key,value)
        @ivar.each do |sub_arr|
            if sub_arr[0] == key
                sub_arr[-1] = value
                break
            end
        end
        @ivar << [key,value]
    end
    
    def get(key)
        @ivar.each do |sub_arr|
            return sub_arr[-1] if sub_arr[0] == key
        end
        nil
    end

    def delete(key)
        @ivar.each_with_index do |sub_arr, index|
            @ivar.delete_at(index) if sub_arr[0] == key
        end
    end

    def show
        @ivar
    end
end
