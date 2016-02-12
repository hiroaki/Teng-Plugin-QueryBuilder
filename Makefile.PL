use ExtUtils::MakeMaker;

WriteMakefile(
  'NAME'          => 'Teng::Plugin::QueryBuilder',
  'AUTHOR'        => 'WATANABE Hiroaki <hwat@cpan.org>',
  'LICENSE'       => 'perl',
  'VERSION_FROM'  => 'lib/Teng/Plugin/QueryBuilder.pm',
  'PREREQ_PM'     => {
    'version'               => '0.77',
    'parent'                => '0',
    'Test::More'            => '0.32',
    'Class::Accessor::Lite' => '0',
  },
  'META_MERGE' => { # META_MERGE available in version 6.46 and above
    'meta-spec' => { version => 2 },
    'resources' => {
      'repository' => {
        'type'  => 'git',
        'url'   => 'git@github.com:hiroaki/Teng-Plugin-QueryBuilder.git',
        'web'   => 'https://github.com/hiroaki/Teng-Plugin-QueryBuilder.git',
      },
    },
  },
);
