class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      # TODO: How do we reference agnostically?
      t.references :account, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
