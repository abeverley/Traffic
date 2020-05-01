package Traffic::Schema::Result::Subject;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("subject");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "text", is_nullable => 1 },
  "order",
  { data_type => "integer", is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "points",
  "Traffic::Schema::Result::Point",
  { "foreign.subject_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

sub as_hash
{   my $self = shift;
    +{
        id    => $self->id,
        title => $self->title,
    };
}

1;
