class Idea < ApplicationRecord
  # many-to-one relationship with user. One user can have many ideas.
  belongs_to :user
end
