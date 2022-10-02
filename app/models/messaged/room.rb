module Messaged
  class Room < ApplicationRecord
    has_many :messages
  end
end