# NAME

Teng::Plugin::QueryBuilder - Query builder

# SYNOPSIS

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

# DESCRIPTION

This is a [Teng](http://search.cpan.org/dist/Teng/) plugin,
it provides `query` that was ported from `resultset` of [DBIx::Skinny](http://search.cpan.org/dist/DBIx-Skinny/).

[Teng](http://search.cpan.org/dist/Teng/) was replacement of [DBIx::Skinny](http://search.cpan.org/dist/DBIx-Skinny/),
and it has compatibility of basic architecture.
Therefore, Almost all source codes have been prepared by it.
I only changed its namespace, and a name of the method to `query` from `resultset`.

However, the iterator which will be returned by the method `retrieve`,
its function has degraded than Skinny's one (I think so).
So you may have to dig its low-level data structure up to satisfy lack.

# AUTHOR

WATANABE Hiroaki <hwat@cpan.org>

# LICENSE

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

# SEE ALSO

[DBIx::Skinny](http://search.cpan.org/dist/DBIx-Skinny/)

[Teng](http://search.cpan.org/dist/Teng/)
