# Post Order Traversal:
  def post_order(left, light, root)

  end

# Pre Order Traversal:
  def pre_order(root, left, right)

  end

  # if you want to do the interview questions you change the ordering of
  # this to make that it does post and pre order
    def in_order_traversal(tree_node = @root, arr = [])
      # left children, itself, right children
      if tree_node.left
        in_order_traversal(tree_node.left, arr)
      end

      arr.push(tree_node.value)

      if tree_node.right
        in_order_traversal(tree_node.right, arr)
      end

      arr
    end

# LCA:
# In a binary search tree, an *ancestor* of a `example_node` is a node
# that is on a higher level than `example_node`, and can be traced directly
# back to `example_node` without going up any levels. (I.e., this is
# intuitively what you think an ancestor should be.) Every node in a binary
# tree shares at least one ancestor -- the root. In this exercise, write a
# function that takes in a BST and two nodes, and returns the node that is the
# lowest common ancestor of the given nodes. Assume no duplicate values.

def lca_iter(tree_node, node1, node2)
  smaller = node1.value < node2.value ? node1.value : node2.value
  bigger = node1.value > node2.value ? node1.value : node2.value

  while !(tree_node.value >= smaller && tree_node.value <= bigger)
    if tree_node.value > smaller && tree_node.value > bigger
      tree_node = tree_node.left
    elsif tree_node.value < smaller && tree_node.value < bigger
      tree_node = tree_node.right
    end
  end

  tree_node
end

def lca(tree_node, node1, node2)
  smaller = node1.value < node2.value ? node1.value : node2.value
  bigger = node1.value > node2.value ? node1.value : node2.value

  if tree_node.value >= smaller && tree_node.value <= bigger
    lca = tree_node
  elsif tree_node.value > smaller && tree_node.value > bigger
    lca = lca(tree_node.left, node1, node2)
  elsif tree_node.value < smaller && tree_node.value < bigger
    lca = lca(tree_node.right, node1, node2)
  end

  lca
end
