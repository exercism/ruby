module BookKeeping
  VERSION = 71
end

Node = Struct.new(:value, :left, :right)

Crumb = Struct.new(:direction, :value, :tree)

class Zipper
  attr_reader :value

  def initialize(value, left, right, crumbs=[])
    @value = value
    @left = left
    @right = right
    @crumbs = crumbs
  end

  def self.from_tree(tree)
    Zipper.new(tree.value, tree.left, tree.right)
  end

  def to_tree
    tree = Node.new(value, @left, @right)
    for crumb in @crumbs
      case crumb.direction
      when :left
        tree = Node.new(crumb.value, tree.dup, crumb.tree)
      when :right
        tree = Node.new(crumb.value, crumb.tree, tree.dup)
      end
    end
    tree
  end

  def left
    return nil if @left.nil?
    crumbs = [Crumb.new(:left, value, @right)] + @crumbs
    Zipper.new(@left.value, @left.left, @left.right, crumbs)
  end

  def right
    return nil if @right.nil?
    crumbs = [Crumb.new(:right, value, @left)] + @crumbs
    Zipper.new(@right.value, @right.left, @right.right, crumbs)
  end

  def up
    crumb = @crumbs.first
    return nil if crumb.nil?
    remaining_crumbs = @crumbs.drop(1)
    case crumb.direction
    when :left
      Zipper.new(crumb.value,
                 Node.new(value, @left, @right),
                 crumb.tree,
                 remaining_crumbs)
    when :right
      Zipper.new(crumb.value,
                 crumb.tree,
                 Node.new(value, @left, @right),
                 remaining_crumbs)
    end
  end

  def set_value(new_value)
    Zipper.new(new_value, @left, @right, @crumbs)
  end

  def set_left(node)
    Zipper.new(value, node, @right, @crumbs)
  end

  def set_right(node)
    Zipper.new(value, @left, node, @crumbs)
  end

  def ==(other_zipper)
    return false unless other_zipper.is_a? Zipper
    to_tree == other_zipper.to_tree
  end
end
