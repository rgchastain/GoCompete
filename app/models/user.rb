class User < ActiveRecord::Base
  has_secure_password

  has_many :competitions, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :competes, dependent: :destroy
  has_many :competing, through: :competes, source: :competition

  email_validate = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :city, :skill, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: email_validate}

  before_save :downcase_email
  
  def downcase_email
      self.email.downcase!
  end
end
