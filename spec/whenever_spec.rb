describe 'Scheduler' do
include Shoulda::Whenever

  describe 'Random three tours every Sunday' do
    let(:whenever) { Whenever::JobList.new(file: File.join(Rails.root, "config", "schedule.rb").to_s) }

    it 'display three tours on welcome page' do
      expect(whenever).to schedule('Tour.feature_tours').every(:monday).at('07:00 am')
    end
  end
end