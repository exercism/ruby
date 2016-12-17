module Generator
  # Wrap git shell commands.
  class GitCommand
    def self.abbreviated_commit_hash(git_path, repository_relative_path)
      `git --git-dir=#{git_path} log -1 --pretty=format:'%h' -- #{repository_relative_path}`
    end
  end
end
