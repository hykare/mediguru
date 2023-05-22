specialties = %w[
  ginekolog
  psycholog
  ortopeda
  stomatolog
  psychiatra
  chirurg
  laryngolog
  dermatolog
]

FactoryBot.define do
  factory :specialty do
    name { specialties.sample }
  end
end
