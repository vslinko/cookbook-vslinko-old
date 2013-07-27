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
  "nerdcommenter" => "https://github.com/scrooloose/nerdcommenter.git",
  "nerdtree" => "https://github.com/scrooloose/nerdtree.git",
  "vim-coffee-script" => "https://github.com/kchmck/vim-coffee-script.git",
  "vim-jade" => "https://github.com/digitaltoad/vim-jade.git",
  "vim-twilight" => "https://github.com/matthewtodd/vim-twilight.git"
}

vimbundles.each do |name, repository|
  git "#{dot_vim}/bundle/#{name}" do
    repository repository
    user node[:vslinko][:user]
    group node[:vslinko][:group]
  end
end

cookbook_file "#{node[:vslinko][:home]}/.vimrc" do
  owner node[:vslinko][:user]
  group node[:vslinko][:group]
end
