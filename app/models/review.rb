class Review < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient, optional: true

  def as_json(_options = {})
    formatted_date = created_at.strftime("%m.%d.%Y")
    { score:, author: patient.first_name, posted_on: date_formatted, body: }
  end

  def date_formatted
    created_at.strftime("%m.%d.%Y")
  end
end
