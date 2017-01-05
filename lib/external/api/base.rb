class External::Api::Base
  include HTTParty
  base_uri 'api.openweathermap.org'

  VERSION = '2.5'.freeze
  APP_ID = '5bcfbb0f813f47032668813c66045259'.freeze
  CACHE = ActiveSupport::Cache::MemoryStore.new

  def get(uri:, query_params: {})
    self.class.get(uri, { query: query_params.merge(APPID: APP_ID) })
  end
end