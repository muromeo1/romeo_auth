module RomeoAuth
  class User < ApplicationRecord
    self.table_name = 'users'

    has_secure_password

    validates :name, :password, :password_confirmation, presence: true
    validates :email, presence: true, uniqueness: true
  end
end
