# Rex::NTP::Base

A simple module to manage NTP.

# USAGE

```perl
include qw/Rex::NTP::Base/;

task setup => make {
  Rex::NTP::Base::setup();
};
```
