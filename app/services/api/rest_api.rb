# frozen_string_literal: true

module Api
  class RestApi
    def initialize
      @data = {}
      @timestamp = Time.now.utc.to_s
    end

    def call
      chaching_service.data_expired? ? data : chaching_service.load_values
    end

    def url
      ENV['CRYPTO_URL']
    end

    private

    attr_reader :rate, :timestamp

    def data
      data =
        %w[BTC ETH XRP].each_with_object({}) do |crypto, obj|
          case crypto
          when 'BTC'
            obj[crypto] = parse_data 'tBTCEUR'
          when 'ETH'
            obj[crypto] = parse_data 'tETHEUR'
          when 'XRP'
            obj[crypto] = parse_data 'tXRPUSD'
            obj['RATE'] = rate
          end
        end
      data['TIME_STAMP'] = timestamp
      chaching_service(data: data).store_values
    end

    def chaching_service(data: nil)
      Caching::CacheService.new(data: data)
    end

    def parse_data(id)
      response = RestClient.get(url + id)
      JSON.parse(response, symbolize_names: true).flatten[7] * converter(id)
    end

    def converter(currency)
      return 1 unless currency.ends_with?('USD')

      response = RestClient.get(ENV['CONVERTER_URL'])
      @rate = JSON.parse(response, symbolize_names: true)[:data][:EUR]
    end
  end
end
