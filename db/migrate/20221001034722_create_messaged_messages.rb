class CreateMessagedMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messaged_messages do |t|
      t.references :tenant, type: tenant_id_type, index: false
      t.index [:tenant_id], name: :index_messaged_messagess_on_tenant_id

      t.references :user, type: user_id_type, index: false
      t.index [:user_id], name: :index_messaged_messagess_on_user_id

      t.references :room, foreign_key: true

      t.text :content

      # Choose an association: room, user, tenant
      t.string :delivery_target

      t.timestamps
    end
  end
end
