class Fbvideo < ActiveRecord::Base
  default_scope  { order(:sort_number => :asc) }
   paginates_per 5
end
