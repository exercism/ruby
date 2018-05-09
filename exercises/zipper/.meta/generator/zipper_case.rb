require 'generator/exercise_case'

class ZipperCase < Generator::ExerciseCase
  def workload
    body = [
      "#{initial_tree}\n",
      "zipper = Zipper.from_tree(tree)\n",
      "value = #{operations(input)}\n",
      "#{expected_by_type}\n",
      assertion
    ]
    indent(body, 4)
  end

  private

    def initial_tree
      indent([ 
        "tree =\n",
        build_tree(input['initialTree'])
      ], 6)
    end

    def operations(input, zipper_name='zipper')
      operation_chain = input['operations'].map do |op|
        operation = op['operation']
        item = op['item']

        set_tree = lambda do
          if item.nil?
            "#{operation}(nil)"
          else
            depth = ' ' * 6
            left = nil_if build_tree(item['left'], 5)
            right = nil_if build_tree(item['right'], 5)
            # I know. This line is crazy.
            "#{operation}(\n#{depth}Node.new(#{item['value']},\n  #{depth}#{left},\n  #{depth}#{right}))"
          end
        end

        case operation
        when 'set_value'
          "#{operation}(#{op['item']})"
        when 'set_left'
          set_tree.call
        when 'set_right'
          set_tree.call
        else
          operation
        end
      end.join('.')
      "#{zipper_name}.%s" % operation_chain
    end

    def assertion
      if expected['value'].nil? && expected['initialTree'].nil?
        'assert_nil value'
      else
        'assert_equal expected, value'
      end
    end

    def expected_by_type
      case expected['type']
      when 'tree'
        indent([
          "expected = \n",
          build_tree(expected['value'])
        ], 6)
      when 'int'
        "expected = #{expected['value']}"
      when 'zipper'
        if expected['initialTree']
          indent([
            "expected_tree =\n  ",
            "#{build_tree(expected['initialTree'])}\n",
            "expected_zipper = Zipper.from_tree(expected_tree)\n",
            "expected = #{operations(expected, 'expected_zipper')}" 
          ], 4)
        elsif expected['value'].nil?
          "expected = nil"
        end
      end
    end

    def build_tree(input, depth=4)
      return 'nil' if input.nil?
      next_depth = depth + 1
      tree = 
        "Node.new(#{input['value']},\n",
        "#{build_tree(input['left'], next_depth)},\n",
        "#{build_tree(input['right'], next_depth)})"
      indent(tree, depth * 2)
    end

    def indent(lines, spaces)
      lines.join(' ' * spaces)
    end

    def nil_if(value)
      if value.nil?
        'nil'
      else
        value
      end
    end
end
