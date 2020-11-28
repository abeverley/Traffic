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
  "subject_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
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
  "is_record",
  { data_type => "smallint", is_nullable => 0, default => 0 },
  "is_pp",
  { data_type => "smallint", is_nullable => 0, default => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "subject",
  "Traffic::Schema::Result::Subject",
  { id => "subject_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

__PACKAGE__->has_many(
  "comments",
  "Traffic::Schema::Result::Comment",
  { "foreign.point_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 1 },
);

sub sqlt_deploy_hook {
    my ($self, $sqlt_table) = @_;
    $sqlt_table->add_index(name => 'point_idx_is_record', fields => ['is_record']);
    $sqlt_table->add_index(name => 'point_idx_is_pp', fields => ['is_pp']);
}

sub as_hash
{   my $self = shift;
    my $comment = encode_entities($self->comment);
    $comment = "<h6>$comment</h6>" if $self->is_record;
    my $feedback = $self->is_record && $self->has_column_loaded('keep_count') && {
        keep    => $self->get_column('keep_count'),
        improve => $self->get_column('improve_count'),
        remove  => $self->get_column('remove_count'),
    };
    return +{
        html             => $comment,
        subject          => encode_entities($self->subject ? $self->subject->title : ''),
        id               => $self->id,
        has_image        => !!$self->file_mimetype,
        is_record        => $self->is_record,
        feedback         => $feedback,
        thumbnail_width  => $self->thumbnail_width,
        thumbnail_height => $self->thumbnail_height,
    }
}

1;
