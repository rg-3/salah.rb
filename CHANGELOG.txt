# CHANGELOG

## next

* Nothing so far.

## v1.1.0

* Update docs.

* Add `Salah::Response#headers`.

## v1.0.1

* Update the gems' description

## v1.0.0

* Add README.md documentation for `Salah.day`.

## v0.11.0

* Accept short form `lat` and `lng` for the latitude and longitude params.

## v0.10.0

* Fix `Salah.tomorrow` by implementing it on top of `Salah.day`.

* Add `Salah.day` for retrieving prayers for a given day.

## v0.9.0

* Add day of the week predicates to `Salah::Prayer` and `Salah::Date`.

## v0.8.1

* `git mv readme.md README.md`
* Documented parts of the API and improved the README.md documentation

## v0.8.0

* Default to the `Muslim World League` as the method for calculating prayer times.

* Cast location and juristic using `Kernel#Integer`.

* Add `Salah::{Location,Juristic}#to_int`.

* Allow an instance of `Salah::Juristic` to be passed as the `juristic: ` option.

* Add `Salah.juristics`.

* Add `Salah::Juristic`.

## v0.7.1

* Fix `openstruct-from_hash.rb` dependency.

## v0.7.0

* Add `Salah::HTTP::NoLocationError` and raise it when location requirements are missing.

* Add custom `user-agent` when making requests to the [PrayerTimes.date](https:/www.prayertimes.date) API.

* Add `Salah::Prayer#location`, which returns an instance of `Salah::Location`.

* Add `Salah::Location`.

## v0.5.0

* Add `Salah::Response#code`.

* Add `Salah::Response#status`.

## v0.4.0

* Improve `Salah::HTTP`.

* Add `Salah::HTTP::BadContentTypeError` and raise it when the response
  has an unexpected content type.

## v0.3.0

* Improve `Salah::Response`.

* Add `Salah::HTTP::BadResponseError` and raise it when the response is
  anything other than `Net::HTTPOK`.

## v0.2.0

* Add `Salah::Prayer#{fajr,dhuhr,asr,maghrib,isha}?` predicates.

## v0.1.3

* Update gem description.

## v0.1.2

* Update gem description.

## v0.1.1

* Update `Salah::HTTP#initialize` to accept an API key.

* Update `Salah::HTTP` to make use of the API key provided to `Salah::HTTP#initialize`.
