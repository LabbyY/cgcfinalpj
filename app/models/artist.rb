class Artist < ApplicationRecord
  scope :ordered, -> { ordered("artistname, created_at desc") }
end
