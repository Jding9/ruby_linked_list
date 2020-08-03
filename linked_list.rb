
class Node 

    attr_accessor :value, :next_node

    def initialize
        @value = nil
        @next_node = nil
    end

    def set_value(value)
        @value = value
    end

    def set_next_node(node)
        @next_node = node
    end

end

class LinkedList

    attr_accessor :head

    def initialize
        @head = nil
    end

    def append(value) #adds a new node containing value to the end of the list
        if @head == nil
            @head = Node.new()
            @head.set_value(value)
        else
            new_node = Node.new()
            new_node.set_value(value)
            
            start_node = @head

            until start_node.next_node.nil?
                start_node = start_node.next_node
            end

            start_node.next_node = new_node
        end
    end

    def prepend(value) #adds a new node containing value to the beginning of the list 
        if @head == nil
            @head = Node.new()
            @head.set_value(value)
        else
            second_node = @head
            first_node = Node.new()
            first_node.set_value(value)
            first_node.set_next_node(second_node)
            @head = first_node
        end

    end 

    def size #returns the total number of nodes in the list
        count = 0
        start_node = @head

        if @head == nil
            return
        else
            until start_node.next_node == nil
                count += 1
                start_node = start_node.next_node
            end
            count += 1
        end

        return count
    end

    def head #returns the first node in the list
        @head
    end

    def tail #returns the last node in the list
        start_node = @head
        until start_node.next_node == nil
            start_node = start_node.next_node
        end

        return start_node
    end

    def at(index) #returns the element at the given index
        start_node = @head
        pos = 0
        until pos == index
            start_node = start_node.next_node
            pos += 1
        end
        return start_node
    end

    def pop #removes the last element in the list
        start_node = @head
        until start_node.next_node.next_node == nil
            start_node = start_node.next_node
        end
        start_node.set_next_node(nil)
    end
    
    def contains?(value) # returns true if the passed value is in the list and otherwise returns false
        start_node = @head
        value_found = false

        until start_node.next_node == nil || value_found == true
            if start_node.value == value
                value_found = true
            else
                start_node = start_node.next_node
            end
        end

        if start_node.value == value # tests the tail value
            value_found = true
        end

        return value_found
    end

    def find(value) #returns the index of the node containing value, or nil if not found
        start_node = @head

        value_found = nil

        index = 0

        until start_node.next_node == nil || value_found
            if start_node.value == value
                value_found = true
            else
                start_node = start_node.next_node
                index += 1
            end
        end

        if start_node.value == value
            value_found = true
        end

        if value_found == true
            return index
        else
            return value_found
        end
                
    end

    def to_s #represents your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be (value) -> (value) -> (value) -> (nil)
        start_node = @head

        until start_node.next_node == nil
            print "#{start_node.value} -> "
            start_node = start_node.next_node
        end

        print "#{start_node.value} -> nil\n"
    end

    def insert_at(value, index) # that inserts the node with the provided value at the given index
    end

    def remove_at(index) # that removes the node at the given index. (You will need to update the links of your nodes in the list when you remove a node.)
    end

end

list = LinkedList.new()

list.append("move 2")
list.append("move 3")
list.prepend("move 1")
list.prepend("move 0")
list.to_s
p list.size
p "list head: #{list.head}"
p "list tail: #{list.tail}"
p "list position at index 2 is: #{list.at(2).value}"
list.pop
list.to_s
p list.contains?("move 2")
p list.contains?("move 4")