class Restaurant < ActiveRecord::Base
  attr_accessible :genre, :name, :open_hours, :thumbnail, :url
end
