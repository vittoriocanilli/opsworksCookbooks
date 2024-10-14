#
# Cookbook Name:: samplecompany-trackingbackend
# Recipe:: ruby-gems
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

package "Install development files for the GNOME XML library" do
  package_name "libxml2-dev"
end

package "Install XSLT 1.0 processing library - development kit" do
  package_name "libxslt1-dev"
end

package "Install header files for compiling extension modules for Ruby" do
  package_name "ruby-dev"
end

package "Install MySQL database development files" do
  package_name "libmysqlclient-dev"
end

gem_package "Install bundler to manage the application's dependencies" do
  package_name "bundler"
end