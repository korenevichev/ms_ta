module Recipes
  class Find
    def initialize(client: Client.build_default)
      @client = client
    end

    def call(id:)
      Rails.cache.fetch("find-#{id}", expires_in: 15.minutes) do
        @client.entry(id)
      end
    end
  end
end