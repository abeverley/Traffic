package Traffic::Schema::Result::Point;

use strict;
use warnings;

use HTML::Entities qw/encode_entities/;

use base 'DBIx::Class::Core';

__PACKAGE__->table("point");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "submitted",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "lat",
  { data_type => "decimal", is_nullable => 1, size => [10, 8] },
  "long",
  { data_type => "decimal", is_nullable => 1, size => [10, 8] },
  "postcode",
  { data_type => "text", is_nullable => 1 },
  "comment",
  { data_type => "text", is_nullable => 1 },
  "file_name",
  { data_type => "text", is_nullable => 1 },
  "file_mimetype",
  { data_type => "text", is_nullable => 1 },
  "file_content",
  { data_type => "longblob", is_nullable => 1 },
  "thumbnail",
  { data_type => "longblob", is_nullable => 1 },
  "thumbnail_width",
  { data_type => "integer", is_nullable => 1 },
  "thumbnail_height",
  { data_type => "integer", is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

sub as_hash
{   my $self = shift;
    return +{
        html             =>  encode_entities($self->comment),
        id               => $self->id,
        has_image        => !!$self->file_mimetype,
        thumbnail_width  => $self->thumbnail_width,
        thumbnail_height => $self->thumbnail_height,
    }
}

1;
