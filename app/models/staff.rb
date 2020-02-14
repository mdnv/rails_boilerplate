# frozen_string_literal: true

class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {moderator: 0, administrator: 9}
  enum status: {disactive: 0, active: 1}

  has_one_attached :avatar

  validates :username, presence: true, length: {in: 6..20}
  validates :status, presence: true, inclusion: {in: statuses.keys}
  validates :role, presence: true, inclusion: {in: roles.keys}

  def avatar_image(size = Settings.images.sizes.avatar)
    return format(Settings.images.default_avatar, size: size) unless avatar.attached?

    avatar.variant(resize: "#{size}x#{size}").processed
  end
end
