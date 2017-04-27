# frozen_string_literal: true
class User < ApplicationRecord
  include Authentication
  has_many :examples

  # one-to-many relationship with ideas. If a user is destroyed, any associated ideas should be destroyed.
  has_many :ideas, dependent: :destroy
end
