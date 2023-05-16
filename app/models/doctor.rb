class Doctor < ApplicationRecord
  belongs_to :specialty
  has_many :appointments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :schedule, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  def as_json(_options = {})
    {
      first_name:,
      last_name:,
      specialty: specialty.name,
      description:
    }
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
