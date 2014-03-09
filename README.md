# Stractor

Extracts structured data from given text based on a given template.

## Templates
Templates are defined by replacing the desired structured text with liquid-style tags.


### Example Data

    ***** Nagios *****

    Notification Type: PROBLEM

    Service: check_https_cms
    Host: nginx.jsf.io
    Address: nginx.jsf.io
    State: CRITICAL

    Date/Time: Fri Feb 28 11:34:02 UTC 2014

    Additional Info:

    CHECK_NRPE: Socket timeout after 10 seconds.

### Example Template

    ***** Nagios *****

    Notification Type: {{ problem }}

    Service: {{ service }}
    Host: {{ host }}
    Address: {{ address }}
    State: {{ state }}

    Date/Time: {{ datetime }}

    Additional Info:

    {{ additional_info }}


### Parsed Data
MatchData object, can be accessed roughly like a Hash with the following structure
    
    {
      problem: 'PROBLEM',
      service: 'check_https_cms',
      host: 'nginx.jsf.io',
      address: 'nginx.jsf.io',
      state: 'CRITICAL',
      datetime: 'Fri Feb 28 11:34:02 UTC 2014',
      additional_info: 'CHECK_NRPE: Socket timeout after 10 seconds.'
    }

## Installation

Add this line to your application's Gemfile:

    gem 'stractor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stractor

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( http://github.com/modsognir/stractor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
