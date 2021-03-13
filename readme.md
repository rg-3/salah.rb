# salah.rb

**Table of contents**

* [Introduction](#introduction)
* [Examples](#examples)
* [Install](#install)
* [Thanks](#thanks)
* [License](#license)

## <a id='introduction'>Introduction</a>

Salah.rb is a Ruby library that provides an API for retrieving Islamic prayer times.
The library is implemented by making HTTP requests to the [PrayerDates.date](https://prayertimes.date) web API in order
to obtain the prayer times. The [PrayerDates.date](https://prayertimes.date) web API is free to use and at the time of 
writing does not require an API key.

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

## <a id='install'> Install

Salah.rb is available [as a RubyGem](https://rubygems.org/gems/salah.rb).

    gem install salah.rb

 