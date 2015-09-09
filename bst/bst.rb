class Node
	attr_accessor :value, :parent, :left_child, :right_child

	def initialize(value, parent = nil, left_child = nil, right_child = nil)
		@value = value
		@parent = parent
		@left_child = left_child
		@right_child = right_child
	end
end

class BST
	attr_accessor :root

	def initialize(value = nil)
		@root = nil
	end


	def add_node(value, focus_node = nil)
		if @root.nil?
			@root = Node.new(value)
			#focus_node = @root
		elsif value <= focus_node.value
			focus_node.left_child.nil? ? focus_node.left_child = Node.new(value) : add_node(value, focus_node.left_child)
		elsif value >= focus_node.value
			focus_node.right_child.nil? ? focus_node.right_child = Node.new(value) : add_node(value, focus_node.right_child)
		end
	end

	def build_tree(arr)
		#arr.shuffle!
		arr.each do |data|
			add_node(data, @root)
		end
	end

	def breadth_first_search(value)
		queue = [@root]
		while !queue.empty?
			current = queue.shift
			if current.value == value
				puts "Seach successful!"
				return value
			else
				queue.push(current.left_child) if current.left_child
				queue.push(current.right_child) if current.right_child
			end
		end
		puts "The value was not found."
		return nil
	end

	def depth_search_search(value)
		stack = [@root]
		visited = []
		while !stack.empty?
			current = stack.pop
			visited << current
			if current.value == value
				puts "Search successful!"
				return current
			else
				stack.push(current.right_child) if current.right_child && !visited.include?(current.right_child)
				stack.push(current.right_child) if current.left_child && !visited.include?(current.left_child)
			end
		end
		puts "The value was not found."
		return nil
	end


		
end

bst = BST.new
p bst.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
puts bst.breadth_first_search(67)



