#!/usr/bin/ruby -w

git_bundles = [
  "https://github.com/astashov/vim-ruby-debugger.git",
  "https://github.com/ervandew/supertab.git",
  "https://github.com/godlygeek/tabular.git",
  "https://github.com/hallison/vim-rdoc.git",
  "https://github.com/msanders/snipmate.vim.git",
  "https://github.com/pangloss/vim-javascript.git",
  "https://github.com/scrooloose/nerdtree.git",
  "https://github.com/timcharper/textile.vim.git",
  "https://github.com/tpope/vim-cucumber.git",
  "https://github.com/tpope/vim-fugitive.git",
  "https://github.com/tpope/vim-git.git",
  "https://github.com/tpope/vim-haml.git",
  "https://github.com/tpope/vim-markdown.git",
  "https://github.com/tpope/vim-rails.git",
  "https://github.com/tpope/vim-repeat.git",
  "https://github.com/tpope/vim-surround.git",
  "https://github.com/tpope/vim-vividchalk.git",
  "https://github.com/tsaleh/taskpaper.vim.git",
  "https://github.com/tsaleh/vim-matchit.git",
  "https://github.com/tsaleh/vim-shoulda.git",
  "https://github.com/tsaleh/vim-tcomment.git",
  "https://github.com/tsaleh/vim-tmux.git",
  "https://github.com/vim-ruby/vim-ruby.git",
  "https://github.com/vim-scripts/Gist.vim.git",
  "https://github.com/scrooloose/syntastic",
  "https://github.com/rodjek/vim-puppet.git",
  "https://github.com/vim-scripts/Specky.git"
]

def vimname( b )
    i = b.rindex( /\// )
    b[ (i+1)..-5 ]
end

git_bundles.each do |b|

  puts b, vimname(b)
  puts `git submodule add #{b} bundle/#{vimname(b)}`

end

