class Summit < ActiveRecord::Base
    has_many :summit_in_lists
    has_many :summit_lists, through: :summit_in_lists
end
