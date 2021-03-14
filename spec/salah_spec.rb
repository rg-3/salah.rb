require_relative 'setup'

RSpec.describe Salah do
  # When the VCR cassettes are rewritten to disk update
  # these dates to match.
  let(:iso8601) { Date.civil(2021, 3, 14).iso8601 }
  let(:hijri) { "1442-08-01" }

  describe '.today' do
    around {|ex| VCR.use_cassette('Salah.Today.Rabat') { ex.run } }
    subject { described_class.today(city: 'Rabat') }

    it "includes today's five prayers" do
      expect(subject.prayers.size).to eq(5)
    end

    it "includes a prayer name with each prayer" do
      expect(subject.prayers.map(&:name)).to eq(%w[Fajr Dhuhr Asr Maghrib Isha])
    end

    it "includes a prayer time with each prayer" do
      expect(subject.prayers.map(&:time)).to eq(["05:16", "12:37", "16:00", "18:50", "19:58"])
    end

    it 'includes a city with each prayer' do
      subject.prayers.each {|prayer| expect(prayer.location.city).to eq('Rabat') }
    end

    it 'includes a country with each prayer' do
      subject.prayers.each {|prayer| expect(prayer.location.country).to eq('Morocco') }
    end

    it 'includes an iso8601 date with each prayer' do
      subject.prayers.each {|prayer| expect(prayer.date.iso8601).to eq(iso8601) }
    end

    it 'includes a hijri date with each prayer' do
      subject.prayers.each {|prayer| expect(prayer.date.hijri).to eq(hijri) }
    end
  end
end
