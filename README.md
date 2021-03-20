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
[1] pry(main)> Salah.today(city: 'Amsterdam')
=> #<Salah::Response:0x000055e96db10560
 @code="200",
 @prayers=
  [#<struct Salah::Prayer
    name="Fajr",
    time="04:55",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city="Amsterdam", country="Netherlands", country_code="NL", latitude=52.370216369628906, longitude=4.895167827606201, elevation=5.0, time_zone=nil, local_offset=1.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>,
   #<struct Salah::Prayer
    name="Dhuhr",
    time="12:49",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city="Amsterdam", country="Netherlands", country_code="NL", latitude=52.370216369628906, longitude=4.895167827606201, elevation=5.0, time_zone=nil, local_offset=1.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>,
   #<struct Salah::Prayer
    name="Asr",
    time="16:01",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city="Amsterdam", country="Netherlands", country_code="NL", latitude=52.370216369628906, longitude=4.895167827606201, elevation=5.0, time_zone=nil, local_offset=1.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>,
   #<struct Salah::Prayer
    name="Maghrib",
    time="18:49",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city="Amsterdam", country="Netherlands", country_code="NL", latitude=52.370216369628906, longitude=4.895167827606201, elevation=5.0, time_zone=nil, local_offset=1.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>,
   #<struct Salah::Prayer
    name="Isha",
    time="20:37",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city="Amsterdam", country="Netherlands", country_code="NL", latitude=52.370216369628906, longitude=4.895167827606201, elevation=5.0, time_zone=nil, local_offset=1.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>],
```

**1.2** With latitude and longitude coordinates

```
[2] pry(main)> Salah.today(latitude: 21.422510, longitude: 39.826168)
=> #<Salah::Response:0x000055e96d06d978
 @code="200",
 @prayers=
  [#<struct Salah::Prayer
    name="Fajr",
    time="05:14",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city=nil, country="", country_code="SA", latitude=21.42251, longitude=39.826168, elevation=-9999.0, time_zone=nil, local_offset=3.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>,
   #<struct Salah::Prayer
    name="Dhuhr",
    time="12:29",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city=nil, country="", country_code="SA", latitude=21.42251, longitude=39.826168, elevation=-9999.0, time_zone=nil, local_offset=3.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>,
   #<struct Salah::Prayer
    name="Asr",
    time="15:53",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city=nil, country="", country_code="SA", latitude=21.42251, longitude=39.826168, elevation=-9999.0, time_zone=nil, local_offset=3.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>,
   #<struct Salah::Prayer
    name="Maghrib",
    time="-",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city=nil, country="", country_code="SA", latitude=21.42251, longitude=39.826168, elevation=-9999.0, time_zone=nil, local_offset=3.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>,
   #<struct Salah::Prayer
    name="Isha",
    time="-",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city=nil, country="", country_code="SA", latitude=21.42251, longitude=39.826168, elevation=-9999.0, time_zone=nil, local_offset=3.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>],
 @status="OK">
 ```

**1.3** With a Dutch IP address

```
[3] pry(main)> Salah.today(ip: '31.151.143.105')
=> #<Salah::Response:0x000055e96d26bc98
 @code="200",
 @prayers=
  [#<struct Salah::Prayer
    name="Fajr",
    time="04:55",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city="Amsterdam", country="Netherlands", country_code="NL", latitude=52.37403, longitude=4.88969, elevation=0.0, time_zone=nil, local_offset=1.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>,
   #<struct Salah::Prayer
    name="Dhuhr",
    time="12:49",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city="Amsterdam", country="Netherlands", country_code="NL", latitude=52.37403, longitude=4.88969, elevation=0.0, time_zone=nil, local_offset=1.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>,
   #<struct Salah::Prayer
    name="Asr",
    time="16:01",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city="Amsterdam", country="Netherlands", country_code="NL", latitude=52.37403, longitude=4.88969, elevation=0.0, time_zone=nil, local_offset=1.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>,
   #<struct Salah::Prayer
    name="Maghrib",
    time="18:49",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city="Amsterdam", country="Netherlands", country_code="NL", latitude=52.37403, longitude=4.88969, elevation=0.0, time_zone=nil, local_offset=1.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>,
   #<struct Salah::Prayer
    name="Isha",
    time="20:37",
    date=#<struct Salah::Date iso8601="2021-03-17", hijri="1442-08-04", timestamp=1615939200>,
    school=#<struct Salah::School id=3, name="Muslim World League", fajr_angle=18, isha_angle=17>,
    location=#<struct Salah::Location city="Amsterdam", country="Netherlands", country_code="NL", latitude=52.37403, longitude=4.88969, elevation=0.0, time_zone=nil, local_offset=1.0>,
    juristic=#<struct Salah::Juristic id=0, name="Shafii">>],
 @status="OK">
  ```
  
**2.**

Prayer times are calculated according to a school. The default school is the Muslim World League. 
If you would like to use a different school, you can provide the `school: ` option. A list of schools 
can be found with `Salah.schools`. 

**2.1** `Salah.schools`

This method returns an array of `Salah::School` objects:

```
[1] pry(main)> Salah.schools
=> [#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>,
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

**2.2** Choosing a particular school

The method of calculation can be set by setting the `school: ` option. The school option can be an integer 
from 0 to 12 (excluding 6) or a `Salah::School` object. The default school is the Muslim World League. 

```
[4] pry(main)> Salah.today(latitude: 21.422510, longitude: 39.826168, school: Salah::School.find_by_id(7))
=> #<Salah::Response:0x000055793ab83158
 @code="200",
 @prayers=
  [#<struct Salah::Prayer
    name="Fajr",
    time="05:16",
    date=#<struct Salah::Date iso8601="2021-03-15", hijri="1442-08-02", timestamp=1615766400>,
    school=#<struct Salah::School id=7, name="Institute of Geophysics, University of Tehran", fajr_angle=17.7, isha_angle=14>,
    location=#<struct Salah::Location city=nil, country="", country_code="SA", latitude=21.42251, longitude=39.826168, elevation=-9999.0, time_zone=nil, local_offset=3.0>>,
   #<struct Salah::Prayer
    name="Dhuhr",
    time="12:30",
    date=#<struct Salah::Date iso8601="2021-03-15", hijri="1442-08-02", timestamp=1615766400>,
    school=#<struct Salah::School id=7, name="Institute of Geophysics, University of Tehran", fajr_angle=17.7, isha_angle=14>,
    location=#<struct Salah::Location city=nil, country="", country_code="SA", latitude=21.42251, longitude=39.826168, elevation=-9999.0, time_zone=nil, local_offset=3.0>>,
   #<struct Salah::Prayer
    name="Asr",
    time="15:54",
    date=#<struct Salah::Date iso8601="2021-03-15", hijri="1442-08-02", timestamp=1615766400>,
    school=#<struct Salah::School id=7, name="Institute of Geophysics, University of Tehran", fajr_angle=17.7, isha_angle=14>,
    location=#<struct Salah::Location city=nil, country="", country_code="SA", latitude=21.42251, longitude=39.826168, elevation=-9999.0, time_zone=nil, local_offset=3.0>>,
   #<struct Salah::Prayer
    name="Maghrib",
    time="18:46",
    date=#<struct Salah::Date iso8601="2021-03-15", hijri="1442-08-02", timestamp=1615766400>,
    school=#<struct Salah::School id=7, name="Institute of Geophysics, University of Tehran", fajr_angle=17.7, isha_angle=14>,
    location=#<struct Salah::Location city=nil, country="", country_code="SA", latitude=21.42251, longitude=39.826168, elevation=-9999.0, time_zone=nil, local_offset=3.0>>,
   #<struct Salah::Prayer
    name="Isha",
    time="-",
    date=#<struct Salah::Date iso8601="2021-03-15", hijri="1442-08-02", timestamp=1615766400>,
    school=#<struct Salah::School id=7, name="Institute of Geophysics, University of Tehran", fajr_angle=17.7, isha_angle=14>,
    location=#<struct Salah::Location city=nil, country="", country_code="SA", latitude=21.42251, longitude=39.826168, elevation=-9999.0, time_zone=nil, local_offset=3.0>>],
 @status="OK">
 ```

**3.** `Salah::Response`

**3.1** The response object

By now you might have noticed the `Salah::Response` object. It is returned by `Salah.today`, 
`Salah.tomorrow`, and `Salah.this_week`. Its most useful property is `Response#prayers`, which
returns an array of `Salah::Prayer` objects.

```ruby
res = Salah.today(city: 'Cairo')
fajr = res.prayers.find(&:fajr?)
puts "Fajr is at #{fajr.time} in Cairo"
```

**3.2** Filtering by day of the week

The `Salah.this_week` method returns a response with an array of `Salah::Prayer` 
objects for the week but what if you want to filter to find only the prayers 
for Friday ? No problem, that use case is covered.

```ruby
prayers = Salah.this_week(city: 'Paris').prayers
prayers.select(&:friday?).each do |prayer|
  puts "#{prayer.name} starts at #{prayer.time} on Friday"
end
```

## <a id='install'> Install </a>

Salah.rb is available [as a RubyGem](https://rubygems.org/gems/salah.rb).

    gem install salah.rb

## <a id='thanks'> Thanks </a>

Thanks to the developers and people at [PrayerTimes.date](https://www.prayertimes.date) 
for providing the free web API service that powers salah.rb.

Praise, thanks and gratitude to the The Most Merciful for the inspiration to work on this 
project. 

## <a id='license'> LICENSE </a>

MIT. See [/LICENSE.txt](/LICENSE.txt)
