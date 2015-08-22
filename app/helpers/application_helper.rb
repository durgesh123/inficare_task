module ApplicationHelper

  #Fetch All User From User Table
  def fetch_all_user
    User.all.map(&:name)
  end

  #Fetch All Project From Project Table
  def fetch_all_project
    Project.all.map(&:name)
  end
end