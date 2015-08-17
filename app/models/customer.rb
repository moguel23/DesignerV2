class Customer < ActiveRecord::Base
  #ASSOCIATIONS
  has_many :sites
  has_many :products
  has_many :devices

  #VALIDATION
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :code, presence: true, uniqueness: {case_sensitive: false}
end
