require_relative '../test_helper'

class FakeExercise
  def slug
    'test'
  end

  alias to_s slug

  def directory
    'test/.'
  end

  def example_file
    '.meta/solutions/test.rb'
  end

  def testable_example_file
    'test.rb'
  end

  def test_file
    'test_test.rb'
  end
end

class ExerciseTestsRunnerTest < Minitest::Test
  def test_run
    Dir.stub :mktmpdir, nil, 'dir' do
      cp_mock = Minitest::Mock.new.expect(:call, nil, ['test/.', 'dir'])

      mv_mock = Minitest::Mock.new.expect(
        :call,
        nil,
        ['dir/.meta/solutions/test.rb', 'dir/test.rb']
      )

      ruby_mock = Minitest::Mock.new.expect(
        :call,
        nil,
        ['-I lib -r disable_skip.rb dir/test_test.rb -p']
      )

      FileUtils.stub :cp_r, cp_mock do
        FileUtils.stub :mv, mv_mock do
          runner = ExerciseTestsRunner.new(
            exercise: FakeExercise.new,
            test_options: '-p'
          )

          runner.stub :ruby, ruby_mock do
            assert_output "\n\n#{'-'*64}\nrunning tests for: test\n" do
              runner.run
            end
          end

          cp_mock.verify
          mv_mock.verify
          ruby_mock.verify
        end
      end
    end
  end
end
