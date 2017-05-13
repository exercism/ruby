require 'pathname'

module Generator
  module Files
    def self.read(filename)
      File.read(filename) if File.exist?(filename)
    end

    class Readable
      attr_reader :filename, :exercise_root
      def initialize(filename:, exercise_root: nil)
        @filename = filename
        @exercise_root = exercise_root
      end

      def to_s
        Files.read(filename)
      end

      def abbreviated_commit_hash
        GitCommand.abbreviated_commit_hash(git_path, relative_filename)
      end

      private

      def relative_filename
        Pathname.new(filename).relative_path_from(Pathname.new(exercise_root)).to_s
      end

      def git_path
        File.join(exercise_root, '.git')
      end
    end

    class Writable < Readable
      def save(content)
        write(content) unless content == to_s
        content
      end

      private

      def write(content)
        File.open(filename, 'w') do |file|
          file.write content
        end
      end
    end

    # An Exercise is used as part of a Exercise
    # so expects :paths and :slug to be defined.
    module Exercise
      def paths
        fail NotImplementedError, 'Should return a Generator::Paths object'
      end

      def slug
        fail NotImplementedError, 'Should return a String object'
      end
    end
  end
end
