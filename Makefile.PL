
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "the power of libcurl in the palm of your hands!",
  "AUTHOR" => "Stanislaw Pusep <stas\@sysd.org>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "FindBin" => 0,
    "IO::Socket::INET" => 0,
    "LWP::Simple" => 0,
    "Test::HTTP::Server" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "LWP-Protocol-Net-Curl",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "LWP::Protocol::Net::Curl",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Fcntl" => 0,
    "HTTP::Date" => 0,
    "LWP::Protocol" => 0,
    "LWP::UserAgent" => 0,
    "Net::Curl::Easy" => 0,
    "Net::Curl::Multi" => 0,
    "Net::Curl::Share" => 0,
    "Scalar::Util" => 0,
    "base" => 0,
    "strict" => 0,
    "utf8" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.007",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



