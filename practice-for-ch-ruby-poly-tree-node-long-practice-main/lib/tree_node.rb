class PolyTreeNode
  attr_reader :value, :parent, :children
  attr_writer :children
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        @parent = node
        if node != nil
            if !node.children.include?(self)  
            node.children << self
             end
        end
    end

    














end