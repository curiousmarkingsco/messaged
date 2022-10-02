# This migration comes from messaged (originally 20221001034722)
class CreateMessagedMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messaged_messages do |t|
      # TODO: How do we reference agnostically?
      # t.references :account, null: false, foreign_key: true
      # t.references :user, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
