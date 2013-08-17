
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "the power of libcurl in the palm of your hands!",
  "AUTHOR" => "Stanislaw Pusep <stas\@sysd.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "LWP-Protocol-Net-Curl",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "LWP::Protocol::Net::Curl",
  "PREREQ_PM" => {
    "HTTP::Date" => 0,
    "LWP::Protocol" => 0,
    "LWP::UserAgent" => 0,
    "Net::Curl" => "0.25",
    "URI" => 0
  },
  "TEST_REQUIRES" => {
    "Capture::Tiny" => 0,
    "LWP::Simple" => 0,
    "Test::HTTP::Server" => 0,
    "Test::More" => "0.88"
  },
  "VERSION" => "0.018",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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



