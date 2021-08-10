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
can pass the `key: '...'` option to the described methods.

## <a id='examples'>Examples</a>


```ruby
Salah.today(city: 'Amsterdam')
# => #<Salah::Response:0x000055e96db10560 @code="200", @status="OK", @prayers=[..]>
```

## <a id='install'> Install </a>

Salah.rb is available [as a RubyGem](https://rubygems.org/gems/salah.rb).

    gem install salah.rb

## <a id='thanks'> Thanks </a>

Thanks to the developers and people at [PrayerTimes.date](https://www.prayertimes.date)
for providing the free web API service that powers salah.rb.

Thanks to The Sustainer for guiding me towards working on this project.

## <a id='license'> LICENSE </a>

MIT. See [/LICENSE.txt](/LICENSE.txt)
