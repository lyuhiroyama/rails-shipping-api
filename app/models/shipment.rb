class Shipment < ApplicationRecord
  validates :tracking_number, :status, :origin, :destination, presence: true
end
