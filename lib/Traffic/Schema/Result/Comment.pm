package Traffic::Schema::Result::Comment;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("comment");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "feedback",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "comment",
  { data_type => "text", is_nullable => 1 },
  "point_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "point",
  "Traffic::Schema::Result::Point",
  { id => "point_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

sub sqlt_deploy_hook {
    my ($self, $sqlt_table) = @_;
    $sqlt_table->add_index(name => 'comment_idx_feedback', fields => ['feedback']);
}

sub as_hash
{   my $self = shift;
    +{
        id       => $self->id,
        feedback => $self->feedback,
        comment  => $self->comment,
    };
}

1;
