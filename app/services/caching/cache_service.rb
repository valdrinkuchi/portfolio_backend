module Caching
  class CacheService
    attr_reader :connection, :data, :timestamp

    def initialize(data: nil)
      @connection = Redis.new
      @data = data
      @timestamp = retrieve_data['TIME_STAMP']
    end

    def check_caching
      timestamp.nil? ? new_values : saved_values
    end

    def load_values
      return store_values if data_expired?

      retrieve_data
    end

    def store_values
      return 'Data object is empty' if data.blank?

      connection.set 'CRYPTO_DATA', data
    end

    def retrieve_data
      data = connection.get 'CRYPTO_DATA'
      return {} if data.blank? || data.empty?

      JSON.parse data.gsub('=>', ':')
    end

    def data_expired?
      return true if timestamp.blank?

      parsed_timestamp = Time.parse(timestamp).utc
      now = Time.now.utc
      hour = parsed_timestamp.hour == now.hour
      day = parsed_timestamp == now.day

      hour && day
    end
  end
end
