class Entry < ApplicationRecord

  # Scopes
  scope :processed, -> { where("processed_at IS NOT NULL") }
  scope :not_processed, -> { where("processed_at IS NULL") }

  # Validations
  validates :number, presence: true, numericality: { only_integer: true }

  def process!
    
  end

  def processed!
    self.update(processed_at: Time.new)
  end

  def not_processed!
    self.update(processed_at: nil)
  end

end
