class Like < ActiveRecord::Base
  attr_accessible :ribbit_id, :user_id

  belongs_to :user
  belongs_to :ribbit 
end
