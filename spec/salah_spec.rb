require_relative 'setup'

RSpec.shared_examples 'Salah.today expectations' do
  it "includes today's five prayers" do
    expect(response.prayers.size).to eq(5)
  end

  it "includes a prayer name with each prayer" do
    expect(response.prayers.map(&:name)).to eq(%w[Fajr Dhuhr Asr Maghrib Isha])
  end

  it "includes a prayer time with each prayer" do
    expect(response.prayers.map(&:time)).to eq(prayer_times)
  end

  it 'includes an iso8601 date with each prayer' do
    response.prayers.each {|prayer| expect(prayer.date.iso8601).to eq(iso8601) }
  end

  it 'includes a hijri date with each prayer' do
    response.prayers.each {|prayer| expect(prayer.date.hijri).to eq(hijri) }
  end
end

RSpec.describe Salah do
  describe '.today' do
    describe 'with the city of Rabat' do
      # When the VCR cassettes are rewritten to disk update
      # these three values to match.
      let(:iso8601) { Date.civil(2021, 3, 14).iso8601 }
      let(:hijri) { "1442-08-01" }
      let(:prayer_times) { ["05:16", "12:37", "16:00", "18:50", "19:58"] }

      let(:response) { described_class.today(city: 'Rabat') }
      around {|ex| VCR.use_cassette('Salah.Today.Rabat') { ex.run } }
      include_examples 'Salah.today expectations'

      it 'includes a city with each prayer' do
        response.prayers.each {|prayer| expect(prayer.location.city).to eq('Rabat') }
      end

      it 'includes a country with each prayer' do
        response.prayers.each {|prayer| expect(prayer.location.country).to eq('Morocco') }
      end
    end

    describe 'with the coordinates of Mecca' do
      # When the VCR cassettes are rewritten to disk update
      # these three values to match.
      let(:iso8601) { Date.civil(2021, 3, 14).iso8601 }
      let(:hijri) { "1442-08-01" }
      let(:prayer_times) { ["05:16", "12:30", "15:54", "18:43", "-"] }

      let(:response) { described_class.today(longitude: 39.816667, latitude: 21.416667)}
      around {|ex| VCR.use_cassette('Salah.Today.Mecca') { ex.run} }
      include_examples 'Salah.today expectations'

      it 'includes a country code with each prayer' do
        response.prayers.each{|prayer| expect(prayer.location.country_code).to eq('SA')}
      end
    end

    describe 'with no city, coordinates or IP address' do
      let(:response) { described_class.today }
      it 'raises an error' do
        expect { response }.to raise_error(Salah::HTTP::NoLocationError)
      end
    end

    describe 'with latitude but no longitude' do
      let(:response) { described_class.today latitude: 21.0 }
      it 'raises an error' do
        expect { response }.to raise_error(Salah::HTTP::NoLocationError)
      end
    end

    describe 'with longitude but no latitude' do
      let(:response) { described_class.today longitude: 21.0 }
      it 'raises an error' do
        expect { response }.to raise_error(Salah::HTTP::NoLocationError)
      end
    end
  end
end
