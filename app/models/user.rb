class User < ApplicationRecord
    has_secure_password
    has_many :links, dependent: :destroy
end
