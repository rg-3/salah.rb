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
web API in order to obtain the prayer times. The [PrayerTimes.date](https://prayertimes.date) web API 
is free to use and at the time of writing does not require an API key.

It's possible that in the future an API key will be required. If that comes to be you can pass 
the `key: '...'` option to the methods described in this document.

## <a id='examples'>Examples</a>

**1.**

You can retrieve the prayer times for today, tomorrow, or this week using the methods
`Salah.today`, `Salah.tomorrow`, and `Salah.next_week`. You can provide either a city 
name, the long/lat coordinates, or an IP address to determine your location.

The examples use `Salah.today` but you could also repeat them with `Salah.tomorrow` and 
`Salah.next_week`.

**1.1** 

With a city name:

```
[1] pry(main)> Salah.today(city: 'Rabat')
=> #<Salah::Response:0x00005605c5a24a10
 @prayers=
  [#<struct Salah::Prayer
    name="Fajr",
    time="05:17",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Dhuhr",
    time="12:37",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Asr",
    time="16:00",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Maghrib",
    time="18:49",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Isha",
    time="19:57",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>]>
```

**1.2** 

With latitude and longitude coordinates:

```
[2] pry(main)> Salah.today(latitude: 21.422510, longitude: 39.826168)
=> #<Salah::Response:0x00005605c5cf1658
 @prayers=
  [#<struct Salah::Prayer
    name="Fajr",
    time="05:17",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Dhuhr",
    time="12:30",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Asr",
    time="15:54",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Maghrib",
    time="18:43",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Isha",
    time="-",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>]>
```

**1.3**

With a Dutch IP address:

```
[9] pry(main)> Salah.today(ip: '31.151.143.105')
=> #<Salah::Response:0x00005605c5f6b208
 @prayers=
  [#<struct Salah::Prayer
    name="Fajr",
    time="05:05",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Dhuhr",
    time="12:50",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Asr",
    time="15:57",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Maghrib",
    time="19:02",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Isha",
    time="20:29",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=0, name="Ithna Ashari", fajr_angle=16, isha_angle=14>>]>
  ```
  
**2.**

Prayer times are calculated by a school and by default countries are assigned to particular 
schools, according to the [PrayerTimes.date docs](https://prayertimes.date/api/docs/today).
If you would like to use a particular school different than to the default for your 
country, you can provide the `school: ...` option and you can find a list of schools using 
`Salah.schools`. 

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

We can choose a particular school for calculations by passing the `school: ` option, which can be an integer 
from 0 to 12 (excluding 6) or a `Salah::School` object.


```
[1] pry(main)> Salah.today(latitude: 21.422510, longitude: 39.826168, school: Salah::School.find_by_id(7))
=> #<Salah::Response:0x0000557cabf29e50
 @prayers=
  [#<struct Salah::Prayer
    name="Fajr",
    time="05:17",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=7, name="Institute of Geophysics, University of Tehran", fajr_angle=17.7, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Dhuhr",
    time="12:30",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=7, name="Institute of Geophysics, University of Tehran", fajr_angle=17.7, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Asr",
    time="15:54",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=7, name="Institute of Geophysics, University of Tehran", fajr_angle=17.7, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Maghrib",
    time="18:45",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=7, name="Institute of Geophysics, University of Tehran", fajr_angle=17.7, isha_angle=14>>,
   #<struct Salah::Prayer
    name="Isha",
    time="-",
    date=#<struct Salah::Date iso8601="2021-03-13", hijri="1442-07-29", timestamp=1615593600>,
    school=#<struct Salah::School id=7, name="Institute of Geophysics, University of Tehran", fajr_angle=17.7, isha_angle=14>>]>
 ```

**3**

By now you might have noticed the `Salah::Response` object. It is returned by `Salah.today`, 
`Salah.tomorrow`, and `Salah.next_week`. Its most useful property is `Response#prayers`, which
returns an array of `Salah::Prayer` objects.

```ruby
res = Salah.today(city: 'Cairo')
fajr = res.prayers.find{|prayer| prayer.name == 'Fajr'}
puts "Fajr is at #{fajr.time} in Cairo"
```

## <a id='install'> Install

Salah.rb is available [as a RubyGem](https://rubygems.org/gems/salah.rb).

    gem install salah.rb

 