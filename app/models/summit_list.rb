class SummitList < ActiveRecord::Base
    has_many :summit_in_lists
    has_many :summits, through: :summit_in_lists
end
