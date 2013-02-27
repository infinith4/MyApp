use utf8;
package MyApp::Schema::Result::Twitteruser;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Twitteruser

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

#use base qw/DBIx::Class::ResultSet/;
 
sub auto_create { # (1) auto_createメソッドを作る。
    my ( $class, $hashref, $c ) = @_;
    my $member = $class->create({
        twitter_user_id    => $hashref->{twitter_user_id}, # (2) twitterユーザーIDを登録する。
                                });
    return $member;
}


=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<twitteruser>

=cut

__PACKAGE__->table("twitteruser");

=head1 ACCESSORS

=head2 id_field

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 twitter_user

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 twitter_user_id

  data_type: 'integer'
  is_nullable: 0

=head2 twitter_access_token

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 twitter_access_token_secret

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=cut

__PACKAGE__->add_columns(
  "id_field",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "twitter_user",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "twitter_user_id",
  { data_type => "integer", is_nullable => 0 },
  "twitter_access_token",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "twitter_access_token_secret",
  { data_type => "varchar", is_nullable => 1, size => 100 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_field>

=back

=cut

__PACKAGE__->set_primary_key("id_field");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-27 13:33:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Y4rMsZNpKRwKR5YySzAxKw

__PACKAGE__->resultset_class('MyApp::Schema::ResultSet::Twitteruser'); # (1) 追加行

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
