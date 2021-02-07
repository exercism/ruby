require 'pathname'
require 'generator/git_command'

module Generator
  module Files
    def self.read(filename)
      File.read(filename) if File.exist?(filename)
    end

    class Readable
      attr_reader :filename, :repository_root

      def initialize(filename:, repository_root: nil)
        @filename = filename
        @repository_root = repository_root
      end

      def to_s
        Files.read(filename)
      end

      def abbreviated_commit_hash
        GitCommand.abbreviated_commit_hash(git_path, relative_filename)
      end

      private
      def relative_filename
        Pathname.new(filename).relative_path_from(Pathname.new(repository_root)).to_s
      end

      def git_path
        File.join(repository_root, '.git')
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
  end
end
