# Rex::NTP::Base

A simple module to manage NTP.

# USAGE

```perl
include qw/Rex::NTP::Base/;

task setup => make {
  # @_ required to expose the cli task params to this module's setup() task
  Rex::NTP::Base::setup(@_);
};
```

```bash
# use module defaults
$ rex setup
# explicitly set the service_name option using a task parameter
$ rex setup --service_name=ntpd
```
