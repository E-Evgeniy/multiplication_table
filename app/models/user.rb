# frozen_string_literal: true

# Model for description users
class User < ApplicationRecord
  has_many :results
end
