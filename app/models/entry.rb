class Entry < ApplicationRecord

  # Scopes
  scope :processed, -> { where("processed_at IS NOT NULL") }
  scope :not_processed, -> { where("processed_at IS NULL") }

  # Validations
  validates :number, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :email, presence: true
  validate :phone_number_valid

  # Callbacks
  after_create :process!

  def process!
    @client = Audata::Promo.new(api_key: ENV["AUDATA_PROMO_API_KEY"])
    @client.create_prize({
      prize: {
        prize_type: 'list',
        phone_number: number,
        email: email,
        campaign_id: 8539,
        list_id: 433
      }
    })
  end

  def processed!
    self.update(processed_at: Time.new)
  end

  def not_processed!
    self.update(processed_at: nil)
  end

  def number_full(country_code="+64")
    "#{country_code}#{number.to_i}"
  end

private

  def phone_number_valid
    unless Phony.plausible?(number_full)
      errors.add(:number, "doesn't look like a valid phone number")
    end
  end

end
