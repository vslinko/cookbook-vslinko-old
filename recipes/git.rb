cookbook_file "#{node[:vslinko][:home]}/.gitconfig" do
  owner node[:vslinko][:user]
  group node[:vslinko][:group]
end
