# -*- mode: ruby-*-
#!/usr/bin/env ruby

class String
  def full_path
    if self =~ /^~\//
      "#{ENV['HOME']}/#{self[2..-1]}"
    else
      self
    end
  end
end

def clone_unless_present(path, url, origin: :origin, &blk)
  if Dir.exist?(path.full_path)
    STDOUT.puts "\nFolder \033[32m#{path}\033[0m is already present"
  else
    STDOUT.puts "\nCloning \033[32m#{url}\033[0m in folder \033[32m#{path}\033[0m"
    system("git clone #{url} --origin #{origin} #{path}")
    yield if block_given?
  end
end

# Personal repos
  clone_unless_present("~/shell", "https://github.com/sirech/shell.git", origin: :github) do
    system("sh ~/shell/full-install.sh")
    system("source ~/.bashrc")
  end
  clone_unless_present("~/shell/zshrc/completions", "https://github.com/zsh-users/zsh-completions.git", origin: :github)
  clone_unless_present("~/.oh-my-zsh", "https://github.com/robbyrussell/oh-my-zsh.git", origin: :github)

  clone_unless_present("~/.emacs.d", "https://github.com/syl20bnr/spacemacs.git")
  clone_unless_present("~/.spacemacs.d", "https://github.com/sirech/spacemacs.d.git", origin: :github)

  clone_unless_present("~/.hammerspoon", "https://github.com/sirech/hammerspoon-config.git", origin: :github)

