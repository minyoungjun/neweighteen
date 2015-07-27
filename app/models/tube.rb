class Tube < ActiveRecord::Base
  default_scope  { order(:sort_number => :desc) }
   paginates_per 5

end
