class SummitInList < ActiveRecord::Base
  belongs_to :summit
  belongs_to :summit_list
end
