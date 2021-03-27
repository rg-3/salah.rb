# salah.rb

**Table of contents**

* [Introduction](#introduction)
* [Examples](#examples)
* [Install](#install)
* [Thanks](#thanks)
* [License](#license)

## <a id='introduction'>Introduction</a>

Salah.rb is a Ruby library that provides an API for retrieving Islamic prayer times.
The library is implemented by making HTTP requests to the [PrayerTimes.date](https://prayertimes.date)
web API. The [PrayerTimes.date](https://prayertimes.date) web API is free to use and at the time of
writing does not require an API key.

It's possible that in the future an API key will be required. If that comes to be you
can pass the `key: '...'` option to the methods described in this document.

## <a id='examples'>Examples</a>

**1.**

You can retrieve the prayer times for today, tomorrow, or this week using the methods
`Salah.today`, `Salah.tomorrow`, and `Salah.this_week`. You can provide either a city
name, the long/lat coordinates, or an IP address to determine your location.

The examples use `Salah.today` but you could also repeat them with `Salah.tomorrow` and
`Salah.this_week`.

**1.1** With a city name

```
> Salah.today(city: 'Amsterdam')
# => #<Salah::Response:0x000055e96db10560 @code="200", @status="OK", @prayers=[..]>
```

**1.2** With latitude and longitude coordinates

```
> Salah.today(latitude: 21.422510, longitude: 39.826168)
# => #<Salah::Response:0x000055e96db10560 @code="200", @status="OK", @prayers=[..]>
 ```

**1.3** With a Dutch IP address

```
> Salah.today(ip: '31.151.143.105')
# => #<Salah::Response:0x000055e96db10560 @code="200", @status="OK", @prayers=[..]>
```

**2.** `Salah::Response`

**2.1** The response object

By now you might have noticed the `Salah::Response` object. It is returned by `Salah.today`,
`Salah.tomorrow`, and `Salah.this_week`. Its most useful property is `Response#prayers`, which
returns an array of [`Salah::Prayer`](https://github.com/rg-3/salah.rb/blob/master/lib/salah/prayer.rb)
objects.

```ruby
res  = Salah.today(city: 'Cairo')
fajr = res.prayers.find(&:fajr?)
puts "Fajr is at #{fajr.time} in Cairo"
```

**2.2** Filtering by day of the week

The `Salah.this_week` method returns a response with an array of `Salah::Prayer`
objects for the week but what if you want to filter to find only the prayers
for Friday ? No worries, we can filter to include only Friday's prayers.

```ruby
prayers = Salah.this_week(city: 'Paris').prayers
prayers.select(&:friday?).each do |prayer|
  puts "#{prayer.name} starts at #{prayer.time} on Friday"
end
```

**3.**

Prayer times are calculated according to a school. The default school is the Muslim World League.
If you would like to use a different school, you can provide the `school: ` option. A list of schools
can be found with `Salah.schools`.

**3.1** `Salah.schools`

This method returns an array of `Salah::School` objects:

```
> Salah.schools
[#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>,
 #<struct Salah::School id=1, name="University of Islamic Sciences, Karachi", fajr_angle=18, isha_angle=18>,
 #<struct Salah::School id=2, name="Islamic Society of North America", fajr_angle=15, isha_angle=15>,
 #<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
 #<struct Salah::School id=4, name="Umm Al-Qura University, Mecca", fajr_angle=18.5, isha_angle=90>,
 #<struct Salah::School id=5, name="Egyptian General Authority of Survey", fajr_angle=18, isha_angle=18>,
 #<struct Salah::School id=7, name="Institute of Geophysics, University of Tehran", fajr_angle=17.7, isha_angle=14>,
 #<struct Salah::School id=8, name="Morocco", fajr_angle=19, isha_angle=18>,
 #<struct Salah::School id=9, name="Department of Islamic Advancement, Malaysia (JAKIM)", fajr_angle=20, isha_angle=18>,
 #<struct Salah::School id=10, name="Majlis Ugama Islam Singapura", fajr_angle=20, isha_angle=18>,
 #<struct Salah::School id=11, name="Union des Organisations Islamiques de France", fajr_angle=12, isha_angle=12>,
 #<struct Salah::School id=12, name="Turkey", fajr_angle=12, isha_angle=12>]
```

**3.2** Choosing a particular school

The method of calculation can be set by setting the `school: ` option. The school option can be an integer
from 0 to 12 (excluding 6) or a `Salah::School` object. The default school is the Muslim World League.

```
> Salah.today(latitude: 21.422510, longitude: 39.826168, school: 7)
# => #<Salah::Response:0x000055e96db10560 @code="200", @status="OK", @prayers=[..]>
 ```

**4.** Short form coordinate options

It is possible to provide short form options for the longitude and latitude
params as `lng` and `lat` respectively.

```ruby
> Salah.today(lng: XX.XX, lat: XX.XX)
# => Salah::Response
```

## <a id='install'> Install </a>

Salah.rb is available [as a RubyGem](https://rubygems.org/gems/salah.rb).

    gem install salah.rb

## <a id='thanks'> Thanks </a>

Thanks to the developers and people at [PrayerTimes.date](https://www.prayertimes.date)
for providing the free web API service that powers salah.rb.

Praise, thanks and gratitude to the The Most Merciful for the ability to work on this
project.

## <a id='license'> LICENSE </a>

MIT. See [/LICENSE.txt](/LICENSE.txt)
