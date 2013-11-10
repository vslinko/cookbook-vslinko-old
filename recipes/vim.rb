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
  source "http://www.vim.org/scripts/download_script.php?src_id=19375"
  owner node[:vslinko][:user]
  group node[:vslinko][:group]
end

vimbundles = {
  "Vagrantfile.vim" => "https://github.com/robbevan/Vagrantfile.vim.git",
  "ctrlp.vim" => "https://github.com/kien/ctrlp.vim.git",
  "jellybeans.vim" => "https://github.com/nanotech/jellybeans.vim.git",
  "nerdcommenter" => "https://github.com/scrooloose/nerdcommenter.git",
  "nerdtree" => "https://github.com/scrooloose/nerdtree.git",
  "vim-abolish" => "https://github.com/tpope/vim-abolish.git",
  "vim-autocomplpop" => "https://github.com/clones/vim-autocomplpop.git",
  "vim-coffee-script" => "https://github.com/kchmck/vim-coffee-script.git",
  "vim-fugitive" => "http://github.com/tpope/vim-fugitive.git",
  "vim-jade" => "https://github.com/digitaltoad/vim-jade.git",
  "vim-l9" => "https://github.com/clones/vim-l9.git",
  "vim-matchit" => "http://github.com/tsaleh/vim-matchit.git",
  "vim-multiple-cursors" => "https://github.com/terryma/vim-multiple-cursors",
  "vim-pastie" => "https://github.com/tpope/vim-pastie.git",
  "vim-sensible" => "https://github.com/tpope/vim-sensible.git",
  "vim-stylus" => "https://github.com/wavded/vim-stylus.git",
  "vim-surround" => "https://github.com/tpope/vim-surround.git"
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
