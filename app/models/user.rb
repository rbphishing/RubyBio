class User < ApplicationRecord
    has_secure_password
    has_many :comments, dependent: :restrict_with_error
end
