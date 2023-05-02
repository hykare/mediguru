class Specialty < ApplicationRecord
  has_many :doctors

  def as_json(_options = {})
    { name: }
  end
end
