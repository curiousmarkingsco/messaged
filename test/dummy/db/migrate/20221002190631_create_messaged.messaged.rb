# This migration comes from messaged (originally 20221001034722)
require 'messaged/base_migration'
class CreateMessaged < Messaged::BaseMigration
  def change
    create_table :messaged_messages do |t|
      t.references :tenant, type: user_id_type, index: false
      t.index [:tenant_id], name: :index_messaged_messages_on_tenant_id

      t.references :user, type: tenant_id_type, index: false
      t.index [:user_id], name: :index_messaged_messages_on_user_id

      t.references :messaged_room, foreign_key: true

      t.text :content

      # Choose an association: room, user, tenant
      t.string :delivery_target

      t.timestamps
    end

    create_table :messaged_rooms do |t|
      t.references :tenant, type: user_id_type, index: false
      t.index [:tenant_id], name: :index_messaged_rooms_on_tenant_id

      t.references :user, type: tenant_id_type, index: false
      t.index [:user_id], name: :index_messaged_rooms_on_user_id

      t.string :title

      t.timestamps
    end
  end
end
