require 'rails_helper'

RSpec.describe 'Doctor', type: :system do
  describe 'search' do
    let(:specialty) { FactoryBot.create(:specialty) }
    let(:doctor) { FactoryBot.create(:doctor, specialty:) }

    it 'shows doctor if user searches for their specialty' do
      visit doctors_path
      fill_in 'query', with: doctor.specialty.name
      find('button').click

      expect(page).to have_content(doctor.last_name)
    end
  end
end
