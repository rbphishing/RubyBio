class Link < ApplicationRecord
  belongs_to :user
  has_many :clicks, dependent: :destroy
  acts_as_list scope: :user

end
