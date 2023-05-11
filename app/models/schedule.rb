class Schedule < ApplicationRecord
  belongs_to :doctor

  def as_json(_options={})
    { :schedule => self.content }
  end
end
