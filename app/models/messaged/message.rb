module Messaged
  class Message < ApplicationRecord
    include ActionView::RecordIdentifier

    # TODO: How do we allow engine user's typical boilerplating?
    # belongs_to :account
    # belongs_to :user

    has_rich_text :content
    validates :content, presence: true

    # TODO: How do we allow engine user's typical boilerplating?
    # after_create_commit -> { broadcast_append_later_to [self.account, "messages"], target: "messages", partial: "messages/message" }
    # after_update_commit -> { broadcast_replace_later_to [self.account, "messages"], target: "#{dom_id(self)}", partial: "messages/message" }
    # after_destroy_commit -> { broadcast_remove_to [self.account, "messages"] }

    after_create_commit -> { broadcast_append_later_to ["messages"], target: "messages", partial: "messaged/messages/message" }
    after_update_commit -> { broadcast_replac_latere_to ["messages"], target: "#{dom_id(self)}", partial: "messaged/messages/message" }
    after_destroy_commit -> { broadcast_remove_to ["messages"] }
  end
end