module Messaged
  module UserExtender
    extend ActiveSupport::Concern
    included do
      with_options dependent: :nullify, foreign_key: 'user_id', inverse_of: :user do
        has_many :messages, class_name: 'Messaged::Message', dependent: :destroy
        has_many :rooms, class_name: 'Messaged::Room', dependent: :destroy
      end
    end

    def messaged_anonymous?
      false
    end
  end
end