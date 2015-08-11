class Customer < ActiveRecord::Base
  #ASSOCIATIONS

  #VALIDATION
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :code, presence: true, uniqueness: {case_sensitive: false}
end
