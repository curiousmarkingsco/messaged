module Messaged
  class BaseMigration < ActiveRecord::Migration[7.0]
    protected

    def user_id_type
      Messaged.user_class.columns.find { |c| c.name == Messaged.user_class.primary_key }.sql_type
    end

    def tenant_id_type
      if Messaged&.tenant_class
        Messaged.tenant_class.columns.find { |c| c.name == Messaged.tenant_class.primary_key }.sql_type
      else
        Messaged.user_class.columns.find { |c| c.name == Messaged.user_class.primary_key }.sql_type
      end
    end
  end
end