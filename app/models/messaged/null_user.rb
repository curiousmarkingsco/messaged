module Messaged
  class NullUser
    def id
      nil
    end

    def email
      nil
    end

    def name
      I18n.t('messaged.null_user_name')
    end

    def valid?
      false
    end

    def messaged_anonymous?
      true
    end
  end
end