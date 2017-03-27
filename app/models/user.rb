class User < ActiveRecord::Base

  has_many :indexed_activities
  has_many :summit_completions
  has_many :climb_records

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def unique_summits_count
    summit_completions.flatten.uniq{|s| s.osm_summit_id}.count
  end
end
