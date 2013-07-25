include_recipe "vim"

dotvim = "#{node["vslinko"]["home"]}/.vim"

directories = %W{
  #{dotvim}
  #{dotvim}/autoload
  #{dotvim}/bundle
  #{dotvim}/colors
}

directories.each do |directory|
  directory directory do
    user node["vslinko"]["user"]
    group node["vslinko"]["group"]
  end
end

remote_file "#{dotvim}/autoload/pathogen.vim" do
  source "http://www.vim.org/scripts/download_script.php?src_id=19375"
  user node["vslinko"]["user"]
  group node["vslinko"]["group"]
end

remote_file "#{dotvim}/colors/twilight.vim" do
  source "https://raw.github.com/matthewtodd/vim-twilight/master/colors/twilight.vim"
  user node["vslinko"]["user"]
  group node["vslinko"]["group"]
end

vimbundles = {
  "nerdcommenter" => "https://github.com/scrooloose/nerdcommenter.git",
  "nerdtree" => "https://github.com/scrooloose/nerdtree.git",
  "vim-coffee-script" => "https://github.com/kchmck/vim-coffee-script.git"
}

vimbundles.each do |name, repository|
  git "#{dotvim}/bundle/#{name}" do
    repository repository
    user node["vslinko"]["user"]
    group node["vslinko"]["group"]
  end
end

cookbook_file "#{node["vslinko"]["home"]}/.vimrc" do
  user node["vslinko"]["user"]
  group node["vslinko"]["group"]
end
