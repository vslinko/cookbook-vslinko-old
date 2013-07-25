include_recipe "git"

git "#{node["vslinko"]["home"]}/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh"
  user node["vslinko"]["user"]
  group node["vslinko"]["group"]
end

%w{ .gitconfig .zshrc }.each do |file|
  cookbook_file "#{node["vslinko"]["home"]}/#{file}" do
    user node["vslinko"]["user"]
    group node["vslinko"]["group"]
  end
end
