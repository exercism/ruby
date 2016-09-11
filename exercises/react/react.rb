class Cell
  attr_reader :value

  def initialize(initial_value)
    @value = initial_value
    @dependencies = []
  end

  protected

  attr_reader :dependencies
end

class InputCell < Cell
  def value=(new_value)
    @value = new_value
    @dependencies.each(&:update_dependencies)
    @dependencies.each(&:fire_callbacks)
  end
end

class ComputeCell < Cell
  def initialize(*inputs, &compute)
    new_value = -> { compute.call(*inputs.map(&:value)) }
    super(new_value.call)
    @last_value = @value
    @new_value = new_value
    inputs.each { |i| i.dependencies << self }
    @callbacks = {}
    @callbacks_issued = 0
  end

  def add_callback(&block)
    @callbacks_issued += 1
    @callbacks[@callbacks_issued] = block
    @callbacks_issued
  end

  def remove_callback(id)
    @callbacks.delete(id)
  end

  # TODO: Would like for only InputCells and ComputeCells to call these two.

  def update_dependencies
    new_value = @new_value.call
    return if new_value == @value
    @value = new_value
    @dependencies.each(&:update_dependencies)
  end

  def fire_callbacks
    return if @value == @last_value
    @callbacks.each_value { |c| c.call(@value) }
    @last_value = @value
    @dependencies.each(&:fire_callbacks)
  end
end
