class Patient < ApplicationRecord
  has_many :appointments
  has_many :reviews

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name_initial
    "#{first_name} #{last_name[0]}."
  end
end
