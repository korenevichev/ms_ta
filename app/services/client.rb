module Client
  def self.build_default(access_token: ENV['ACCESS_TOKEN'], space: ENV['SPACE_ID'])
    Contentful::Client.new(
      access_token: access_token,
      space: space,
      dynamic_entries: :auto,
      raise_errors: true
    )
  end
end
