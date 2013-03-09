include_recipe "git"
include_recipe "sudo"
include_recipe "zsh"

group node["vslinko"]["group"]

user node["vslinko"]["user"] do
  comment "Vyacheslav Slinko"
  gid node["vslinko"]["group"]
  home node["vslinko"]["home"]
  shell "/bin/zsh"
  supports :manage_home => true
end

sudo node["vslinko"]["user"] do
  user node["vslinko"]["user"]
  nopasswd true
end

directory "#{node["vslinko"]["home"]}/.ssh" do
  group node["vslinko"]["group"]
  mode 0700
  owner node["vslinko"]["user"]
end

file "#{node["vslinko"]["home"]}/.ssh/authorized_keys" do
  content node["vslinko"]["public_key"]
  group node["vslinko"]["group"]
  mode 0600
  owner node["vslinko"]["user"]
end

execute "#{node["vslinko"]["user"]}_dotfiles" do
  command <<-EOC
    git init
    git remote add origin #{node["vslinko"]["dotfiles"]}
    git pull -u origin master
    git submodule update --init
  EOC
  creates "#{node["vslinko"]["home"]}/.git"
  cwd node["vslinko"]["home"]
  group node["vslinko"]["group"]
  user node["vslinko"]["user"]
end

git node["vslinko"]["home"] do
  group node["vslinko"]["group"]
  repository node["vslinko"]["dotfiles"]
  user node["vslinko"]["user"]
  enable_submodules true
  action :sync
end
