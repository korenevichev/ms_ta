module Recipes
  class List
    def initialize(client: Client.build_default)
      @client = client
    end

    def call(content_type: 'recipe')
      Rails.cache.fetch("list-#{content_type}", expires_in: 15.minutes) do
        @client.entries(content_type: content_type)
      end
    end
  end
end
