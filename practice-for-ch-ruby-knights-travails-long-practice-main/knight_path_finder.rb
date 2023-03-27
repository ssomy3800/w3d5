require_relative "../practice-for-ch-ruby-poly-tree-node-long-practice-main/lib/tree_node.rb"

class KnightPathFinder
    attr_reader :start, :consider_positions
    attr_writer :consider_positions
    def initialize(start)
        @start = start 
        @consider_positions = [start]
        @root_node = PolyTreeNode.new(start)
        self.build_move_tree(@root_node)
        p self.build_move_tree(@root_node)
    end

    # def find_path(destination)
    #     start_point = PolyTreeNode.new(start) 

    # end
    def build_move_tree(root)
        queue = [root] # create a queue to hold nodes to process
        until queue.empty? # process nodes in the queue until there are none left
          node = queue.shift # get the next node from the front of the queue
          new_positions = new_move_positions(node.value) # generate new positions to add as child nodes
          new_positions.each do |pos|
            child = PolyTreeNode.new(pos)
            node.add_child(child) # add the child node to the current node
            queue << child # add the child node to the end of the queue to process later
          end
        end
        root # return the root node of the tree
      end
      

    def new_move_position(pos)
        temp = KnightPathFinder.valid_move(pos)
        result = []
        temp.each do |possible_pos|
            if !self.consider_positions.include?(possible_pos)
                result << possible_pos
            end

        end
        self.consider_positions += result
        result 


    end

    def self.valid_move(start_pos)
        idx1 = start_pos[0]
        idx2 = start_pos[1]
        moves = [[idx1+1, idx2+2],[idx1+1, idx2-2],[idx1-1, idx2+2],[idx1-1, idx2-2],[idx1+2, idx2+1],[idx1+2, idx2-1],[idx1-2, idx2+1],[idx1-2, idx2-1]]
        valid = []
        moves.each do |pair_index|
            if pair_index[0] < 8 &&pair_index[0] >=0 && pair_index[1] < 8 &&pair_index[1] >=0
                valid << pair_index
            end
        end
        valid
    end


end

# test = PolyTreeNode.new(5)

# p KnightPathFinder.valid_move([3,3])
k = KnightPathFinder.new([0,0])
# p k.new_move_position([0,0])
# p k.new_move_position([1,2])
# p k.new_move_position([2,4])