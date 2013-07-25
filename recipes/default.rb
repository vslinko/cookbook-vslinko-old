group node[:vslinko][:group]

user node[:vslinko][:user] do
  comment "Vyacheslav Slinko"
  gid node[:vslinko][:group]
  home node[:vslinko][:home]
  shell "/bin/zsh"
  supports :manage_home => true
end

include_recipe "vslinko::git"
include_recipe "vslinko::ssh"
include_recipe "vslinko::vim"
include_recipe "vslinko::zsh"
