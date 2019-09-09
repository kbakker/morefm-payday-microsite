class Audata::Promo
  include HTTParty

  def initialize(options = {})
    raise "Requires an API key" unless options[:api_key].present?
    api_key = options[:api_key]
    self.class.base_uri "https://promo.audata.io/api/v1"
    @options = {
      headers: {
        'Authorization' =>  "Bearer #{api_key}"
      }
    }
  end

  def get_campaign(id)
    self.class.get("/campaigns/#{id}", @options)
  end

  def create_prize(params)
    self.class.post("/prizes", @options.merge({
      body: params
    }))
  end
end