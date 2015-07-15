class Fbvideo < ActiveRecord::Base
  default_scope  { order(:sort_number => :asc) }
end
