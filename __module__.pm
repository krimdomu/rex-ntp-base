#
# AUTHOR: jan gehring <jan.gehring@gmail.com>
# REQUIRES:
# LICENSE: Apache License 2.0
#
# Simple Module to install Apache on your Server.

package Rex::NTP::Base;

use Rex -base;
use Rex::Ext::ParamLookup;

our %package_map = (
  debian => "ntp",
  ubuntu => "ntp",
  centos => "ntp",
  redhat => "ntp",
);

our %service_name_map = (
  debian => "ntp",
  ubuntu => "ntp",
  centos => "ntpd",
  redhat => "ntpd",
);

our %configuration_file_map = (
  debian => "/etc/ntp.conf",
  ubuntu => "/etc/ntp.conf",
  centos => "/etc/ntp.conf",
  redhat => "/etc/ntp.conf",
);

task setup => make {
  my $pkg = param_lookup "package_name",
    $package_map{ lc get_operating_system };

  my $service = param_lookup "service_name",
    $service_name_map{ lc get_operating_system };

  my $configuration_file = param_lookup "configuration_file",
    $configuration_file_map{ lc get_operating_system };

  my $ntp_server = param_lookup "ntp_server", ["pool.ntp.org"];

  pkg $pkg, ensure => "latest";

  file $configuration_file,
    content   => template("templates/etc/ntp.conf.tpl"),
    owner     => "root",
    group     => "root",
    mode      => 644,
    on_change => make { service $service => "restart"; };

  service $service, ensure => "started";
};

1;
