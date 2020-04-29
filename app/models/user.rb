class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }, format: { with: /\A[a-zA-Z]+\z/ }

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
