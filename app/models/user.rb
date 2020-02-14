# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {moderator: 0, administrator: 1}
  enum status: {disactive: 0, active: 1}

  validates :username, presence: true, length: {in: 6..20}
  validates :password, presence: true, confirmation: true,
                       length: {within: 6..40},
                       on: :create
  validates :email, presence: true, uniqueness: {case_sensitive: false},
                    format: {with: URI::MailTo::EMAIL_REGEXP}
end
