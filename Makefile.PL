
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Make skeleton code with Fey::ORM',
  'AUTHOR' => 'Keedi Kim - 김도형 <keedi@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'App-mkfeyorm',
  'EXE_FILES' => [
    'bin/mkfeyorm.pl'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'App::mkfeyorm',
  'PREREQ_PM' => {
    'File::Basename' => '0',
    'File::Spec::Functions' => '0',
    'Getopt::Long::Descriptive' => '0',
    'Moose' => '0',
    'MooseX::SemiAffordanceAccessor' => '0',
    'MooseX::StrictConstructor' => '0',
    'Template' => '0',
    'autodie' => '0',
    'namespace::autoclean' => '0',
    'utf8' => '0'
  },
  'VERSION' => '0.001',
  'test' => {
    'TESTS' => 't/*.t'
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



