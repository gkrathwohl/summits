class User < ActiveRecord::Base

  has_many :indexed_activities
  has_many :summit_completions
  has_many :climb_records

  def self.find_or_create_from_auth_hash(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.token = auth.credentials.token
      user.save!
    end
  end

  def unique_summits_count
    summit_completions.flatten.uniq{|s| s.osm_summit_id}.count
  end
end
