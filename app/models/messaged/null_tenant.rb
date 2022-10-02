module Messaged
  class NullTenant
    def id
      nil
    end

    def valid?
      false
    end

    def messaged_anonymous?
      true
    end
  end
end