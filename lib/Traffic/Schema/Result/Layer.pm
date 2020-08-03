package Traffic::Schema::Result::Layer;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("layer");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "key",
  { data_type => "text", is_nullable => 1 },
  "type",
  { data_type => "text", is_nullable => 1 },
  "kml",
  { data_type => "longtext", is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

sub as_hash
{   my $self = shift;
    +{
        id   => $self->id,
        key  => $self->key,
        type => $self->type,
        kml  => $self->kml,
    };
}

1;
