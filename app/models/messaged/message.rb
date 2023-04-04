module Messaged
  class Message < ApplicationRecord
    include ActionView::RecordIdentifier

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
    belongs_to :messaged_room, optional: true, class_name: 'Messaged::Room'

    has_rich_text :rich_content
    validates :content, presence: true

    broadcast_to :messaged_room

    # after_create_commit -> { broadcast_append_later_to ["messages"], target: "messages", partial: "messaged/messages/message" }
    # after_update_commit -> { broadcast_replace_later_to ["messages"], target: "#{dom_id(self)}", partial: "messaged/messages/message" }
    # after_destroy_commit -> { broadcast_remove_to ["messages"] }

    # Messages should default to the person sending them, otherwise
    # fallback to the chat room, and finally tenant if they exist.
    def owner
      return user if user
      return messaged_room if messaged_room
      return tenant if Messaged.tenant_class_name && tenant
      return nil # replace with user, tenant, or room
    end
  end
end