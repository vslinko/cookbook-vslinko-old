git "#{node[:vslinko][:home]}/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  user node[:vslinko][:user]
  group node[:vslinko][:group]
end

cookbook_file "#{node[:vslinko][:home]}/.zshrc" do
  owner node[:vslinko][:user]
  group node[:vslinko][:group]
end
