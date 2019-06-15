class Node
    attr_accessor :left, :right, :value

    def initialize(v)
      @value = v
    end
 
    def insert(v)
      case value <=> v
        when 1 then insert_left(v)
        when -1 then insert_right(v)
        when 0 then false # the value is already present
      end
    end

    def self.build_tree(ary)
        tree = Node.new(ary[0])
        ary.each {|item| tree.insert(item)}
        tree
    end

    def inspect
      "{value: #{value}, left: #{left.inspect}, right: #{right.inspect}}"
    end

    def breadth_first_search(v)        
        @stack = [self] if @root_flag.nil?
        puts "stack: #{@stack}"
        @root_flag = 1
        
        while @stack.length > 0
            # puts "@stack.length: #{@stack.length}"
            if @stack[0].value == v
                puts "found it"
                return @stack[0]
            else
                @stack.push(@stack[0].left)
                @stack.push(@stack[0].right)
                @stack.shift
                @stack
            end
        end
    end


  def dfs_rec(v)
    @current_node = self

    return @current_node if @current_node.value == v
        
    if !@current_node.left.nil? && @current_node.left.dfs_rec(v)
      return @current_node.left.dfs_rec(v)
    end

    if !@current_node.right.nil? && @current_node.right.dfs_rec(v)
      return @current_node.right.dfs_rec(v)
    end    
  end

  def depth_first_search(v)
      stack = [self]
      visited = [self]
      while !stack.empty?
          puts"stack #{stack}"
          current = stack.last
          puts"current.value #{current.value}"

          left, right = current.left, current.right
      
          if current.value == v
              puts current
              exit
          elsif !left.nil? && !visited.include?(left)
              if left.value == v
              puts left
              exit
              else
              visited << left
              stack << left
              end
          elsif !right.nil? && !visited.include?(right)
              if right.value == v
              puts right
              exit
              else
              visited << right
              stack << right
              end
          else
              stack.pop
          end
          end
          puts "nil"
    end


    private

      def insert_left(v)
        if left
          left.insert(v)
        else
          self.left = Node.new(v)
        end
      end

      def insert_right(v)
        if right
          right.insert(v)
        else
          self.right = Node.new(v)
        end
      end
end # class Node


x = [6, 2, 8, 1, 3, 7, 9, 0, 4]
tree = Node.build_tree(x)
puts "tree.inspect: #{tree.inspect}"
puts "tree: #{tree}"

puts ""
puts "tree.dfs_rec(0):            #{tree.dfs_rec(0)}"
puts "tree.left.left.left:        #{tree.left.left.left}"
puts "tree.left.left.left.value: #{tree.left.left.left.value}"
puts ""
puts "tree.dfs_rec(4):            #{tree.dfs_rec(4)}"
puts "tree.left.right.right:      #{tree.left.right.right}"
puts "tree.left.right.right.value: #{tree.left.right.right.value}"
puts ""
puts "tree.dfs_rec(2):  #{tree.dfs_rec(2)}"
puts "tree.left:        #{tree.left}"
puts "tree.left.value: #{tree.left.value}"
puts ""
puts "tree.dfs_rec(8):  #{tree.dfs_rec(8)}"
puts "tree.right:       #{tree.right}"
puts "tree.right.value: #{tree.right.value}"
puts ""
puts "tree.dfs_rec(1):  #{tree.dfs_rec(1)}"
puts "tree.left.left:   #{tree.left.left}"
puts "tree.left.left.value: #{tree.left.left.value}"
puts ""
puts "tree.dfs_rec(3):  #{tree.dfs_rec(3)}"
puts "tree.left.right:  #{tree.left.right}"
puts "tree.left.right.value: #{tree.left.right.value}"
puts ""
puts "tree.dfs_rec(7):  #{tree.dfs_rec(7)}"
puts "tree.right.left:  #{tree.right.left}"
puts "tree.right.left.value: #{tree.right.left.value}"
puts ""
puts "tree.dfs_rec(9):  #{tree.dfs_rec(9)}"
puts "tree.right.right: #{tree.right.right}"
puts "tree.right.right.value: #{tree.right.right.value}"
puts ""
puts "tree.dfs_rec(20): #{tree.dfs_rec(20)}"

y = tree.breadth_first_search(7)
y = tree.dfs_rec(10)
puts "tree.breadth_first_search node: #{y} value: #{y.value}"
puts "tree.dfs node:#{y}"
puts "tree.right.left: #{tree.right.left}"
puts "tree.right.left.value: #{tree.right.left.value}"
puts "tree.depth_first_search: #{tree.depth_first_search(7)}"












 

