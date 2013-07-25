directory "#{node[:vslinko][:home]}/.ssh" do
  mode 0700
  owner node[:vslinko][:user]
  group node[:vslinko][:group]
end

file "#{node[:vslinko][:home]}/.ssh/authorized_keys" do
  mode 0600
  owner node[:vslinko][:user]
  group node[:vslinko][:group]
  content node[:vslinko][:public_key]
end
