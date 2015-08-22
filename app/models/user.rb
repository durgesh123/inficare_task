class User < ActiveRecord::Base
  has_many :project
end