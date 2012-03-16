# coding: utf-8
require 'redmine'
require_dependency 'principal'
require_dependency 'user'

Redmine::Plugin.register :redmine_svn_info do
	name 'Redmine Svn url Plugin'
	author 'Mathieu MARACHE, inspired from redmine_git_hosting'
	description 'Enables Redmine / ChiliProject to show svn urls like redmine_git_hosting does'
	version '0.0.1'
	url 'https://github.com/mathieu/redmine_svn_info'
end

# initialize hooks
class SvnProjectShowHook < Redmine::Hook::ViewListener
	render_on :view_projects_show_left, :partial => 'svn_urls'
end

class SvnRepoUrlHook < Redmine::Hook::ViewListener
	render_on :view_repositories_show_contextual, :partial => 'svn_urls'
end
