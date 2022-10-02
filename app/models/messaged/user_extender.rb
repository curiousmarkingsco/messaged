module Messaged
  module UserExtender
    extend ActiveSupport::Concern
    included do
      with_options dependent: :nullify, foreign_key: 'user_id', inverse_of: :user do
        has_many :messages, class_name: 'Messaged::Message'
        has_many :rooms, class_name: 'Messaged::Room'
      end
    end

    def messaged_anonymous?
      false
    end
  end
end