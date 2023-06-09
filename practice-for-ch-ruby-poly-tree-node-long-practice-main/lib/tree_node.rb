class PolyTreeNode
  attr_reader :value, :parent, :children
  attr_writer :children
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if self.parent != nil
            old_parent = self.parent
            old_parent.children.delete(self)
        end
        @parent = node
        if node != nil
            if !node.children.include?(self)  
            node.children << self
             end
        end
    end

    def add_child(node)
        node.parent=(self)
    end

    def remove_child(node)
        if node.parent == nil
            raise_error 'the node has no parent/node is not a child' 
        end 
        node.parent=(nil)
    end


    def dfs(key)
        return self if self.value == key

        self.children.each do |ele| 
           result = ele.dfs(key) 
           return result if result != nil

        end
     return nil
    end


    def bfs(key)
        queue = [self]
        while !queue.empty?
            target = queue.shift
            if target.value == key
                return target
            else
                if target.children != []
                queue += target.children
                end
            end
        end
        return nil
    end


 


    














end