package Teng::Plugin::QueryBuilder;
use strict;
use warnings;
use utf8;
use version 0.77 (); our $VERSION = version->declare('v0.0.1');
use Teng::Plugin::QueryBuilder::SQL;

our @EXPORT = qw/query/;

sub query {
  my ($self, $args) = @_;
  $args->{teng} = $self;
  if ( ($self->{driver_name} || '') eq 'Oracle' ) {
    require Teng::Plugin::QueryBuilder::SQL::Oracle;
    return  Teng::Plugin::QueryBuilder::SQL::Oracle->new($args);
  } else {
    return  Teng::Plugin::QueryBuilder::SQL->new($args);
  }
};

1;
__END__

=pod

=head1 NAME

Teng::Plugin::QueryBuilder - Query builder

=head1 SYNOPSIS

    package MyApp::DB;
    use parent qw/Teng/;
    __PACKAGE__->load_plugin('QueryBuilder');

    package main;
    my $teng = MyApp::DB->new(dbh => ...);

    # Basic usage
    my $query = $teng->query;
    $query->add_select('user.id' => 'user_id');
    $query->from(['user']);
    $query->add_where('user.name' => 'hiroaki');
    $query->add_where('user.age' => {'>' => 20 });
    $query->add_where('user.comment' => \'IS NULL');
    my $iterator = $query->retrieve;

    # Inner join technique
    $joinner = $teng->query;
    $joinner->from([]);
    $joinner->add_join( user => [{
      type      => 'inner',
      table     => 'bookmark',
      condition => 'user.id = bookmark.user_id',
      }]);
    $itrator = $joinner->retrieve;

=head1 DESCRIPTION

This is a L<Teng> plugin, it provides C<query> that was ported from C<resultset> of L<DBIx::Skinny>.

L<Teng> was replacement of L<DBIx::Skinny>, and it has compatibility of basic architecture.
Therefore, Almost all source codes have been prepared by it.
I only changed its namespace, and a name of the method to C<query> from C<resultset>.

However, the iterator which will be returned by the method C<retrieve>,
its function has degraded than Skinny's one (I think so).
So you may have to dig its low-level data structure up to satisfy lack.

=head1 AUTHOR

WATANABE Hiroaki E<lt>hwat@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<DBIx::Skinny>

L<Teng>

=cut
