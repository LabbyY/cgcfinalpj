class Artist < ApplicationRecord
  scope :ordered, -> { ordered("artistname, created_at desc") }
  mount_uploader :avatar, AvatarUploader
end
