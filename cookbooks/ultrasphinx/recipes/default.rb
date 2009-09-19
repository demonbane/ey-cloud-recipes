require 'pp'
#
# Cookbook Name:: ultrasphinx
# Recipe:: default
#
#if_app_needs_recipe("ultrasphinx") do |app,data,index|

# Make sure that we only run this on an app instance and not on a database server.
# The "node" information will be provided by the server, that's why you won't see
# it defined anywhere in this repository.
if ['solo', 'app', 'app_master'].include?(node[:instance_role])

# This is the name of your application as Flex/Solo knows it.
  run_for_app("<app_name>") do |app_name, data|

    directory "/var/run/sphinx" do
      owner node[:owner_name]
      group node[:owner_name]
      mode 0755
    end

    directory "/var/log/engineyard/sphinx/#{app_name}" do
      recursive true
      owner node[:owner_name]
      group node[:owner_name]
      mode 0755
    end

    # This will create a remote file by copying a local file from ./files
    remote_file "/etc/logrotate.d/sphinx" do
      owner "root"
      group "root"
      mode 0755
      source "sphinx.logrotate"
      action :create
    end

    # This will create a remote file using a local template. See the file in
    # ./templates to get a feel for what's going on here.
    template "/etc/monit.d/sphinx.#{app_name}.monitrc" do
      source "sphinx.monitrc.erb"
      owner node[:owner_name]
      group node[:owner_name]
      mode 0644
      variables({
        :app_name => app_name,
        :user => node[:owner_name]
      })
    end

    template "/data/#{app_name}/shared/config/sphinx.yml" do
      owner node[:owner_name]
      group node[:owner_name]
      mode 0644
      source "sphinx.yml.erb"
      variables({
        :app_name => app_name,
        :user => node[:owner_name]
      })
    end

  end

end

