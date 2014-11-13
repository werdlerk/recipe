class Direction < ActiveRecord::Base
  belongs_to :cooking_recipe

  default_scope { order('sort_order ASC') }
end