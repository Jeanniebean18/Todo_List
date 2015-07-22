class Chore < ActiveRecord::Base
  belongs_to :users
  validates :name, presence: true
  validates :done, presence: true
  
end