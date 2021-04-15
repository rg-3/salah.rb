RSpec.shared_examples "Salah.today expectations" do
  it "includes today's five prayers" do
    expect(response.prayers.size).to eq(5)
  end

  it "includes a prayer name with each prayer" do
    expect(response.prayers.map(&:name)).to eq(%w[Fajr Dhuhr Asr Maghrib Isha])
  end

  it "includes a prayer time with each prayer" do
    expect(response.prayers.map(&:time)).to eq(prayer_times)
  end

  it "includes an iso8601 date with each prayer" do
    response.prayers.each { |prayer| expect(prayer.date.iso8601).to eq(iso8601) }
  end

  it "includes a hijri date with each prayer" do
    response.prayers.each { |prayer| expect(prayer.date.hijri).to eq(hijri) }
  end
end
