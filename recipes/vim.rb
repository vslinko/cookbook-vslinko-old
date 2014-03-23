dot_vim = "#{node[:vslinko][:home]}/.vim"

directories = %W{
  #{dot_vim}
  #{dot_vim}/autoload
  #{dot_vim}/bundle
}

directories.each do |directory|
  directory directory do
    owner node[:vslinko][:user]
    group node[:vslinko][:group]
  end
end

remote_file "#{dot_vim}/autoload/pathogen.vim" do
  source "https://raw.githubusercontent.com/vim-scripts/pathogen.vim/master/autoload/pathogen.vim"
  owner node[:vslinko][:user]
  group node[:vslinko][:group]
end

vimbundles = {
  "Vagrantfile.vim" => "git://github.com/robbevan/Vagrantfile.vim.git",
  "ctrlp.vim" => "git://github.com/kien/ctrlp.vim.git",
  "jellybeans.vim" => "git://github.com/nanotech/jellybeans.vim.git",
  "nerdcommenter" => "git://github.com/scrooloose/nerdcommenter.git",
  "nerdtree" => "git://github.com/scrooloose/nerdtree.git",
  "vim-abolish" => "git://github.com/tpope/vim-abolish.git",
  "vim-autocomplpop" => "git://github.com/clones/vim-autocomplpop.git",
  "vim-coffee-script" => "git://github.com/kchmck/vim-coffee-script.git",
  "vim-fugitive" => "git://github.com/tpope/vim-fugitive.git",
  "vim-jade" => "git://github.com/digitaltoad/vim-jade.git",
  "vim-l9" => "git://github.com/clones/vim-l9.git",
  "matchit.zip" => "git://github.com/vim-scripts/matchit.zip.git",
  "vim-multiple-cursors" => "git://github.com/terryma/vim-multiple-cursors",
  "vim-pastie" => "git://github.com/tpope/vim-pastie.git",
  "vim-sensible" => "git://github.com/tpope/vim-sensible.git",
  "vim-stylus" => "git://github.com/wavded/vim-stylus.git",
  "vim-surround" => "git://github.com/tpope/vim-surround.git"
}

vimbundles.each do |name, repository|
  git "#{dot_vim}/bundle/#{name}" do
    repository repository
    user node[:vslinko][:user]
    group node[:vslinko][:group]
    ignore_failure
  end
end

cookbook_file "#{node[:vslinko][:home]}/.vimrc" do
  owner node[:vslinko][:user]
  group node[:vslinko][:group]
end
