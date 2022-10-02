module Messaged
  class Room < ApplicationRecord
    # User association
    belongs_to :user,
      class_name: Messaged.user_class_name,
      inverse_of: :messages,
      optional: true
    # Multi-tenant option
    if Messaged.tenant_class_name
      belongs_to :tenant,
        class_name: Messaged.tenant_class_name,
        inverse_of: :messages,
        optional: true
    end
    validates :title, presence: true

    has_many :messages

    # Messages should default to the person sending them, otherwise
    # fallback to the chat room, and finally tenant if they exist.
    def owner
      return user if user
      return tenant if Messaged.tenant_class_name && tenant
      return nil # replace with user, tenant, or room
    end
  end
end