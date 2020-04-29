package Traffic;

use Dancer2;
use Dancer2::Plugin::DBIC;
use File::Slurp qw/read_file/;
use File::Temp qw/tempfile/;
use Image::Magick;
use Image::Size qw/imgsize/;

get '/' => sub {
    template 'index' => { 'title' => 'Traffic' };
};

get '/image/:id' => sub {
    my $point = schema->resultset('Point')->find(route_parameters->get('id'))
        or return undef;

    my $content = $point->file_content;
    my ($fh, $filename) = tempfile();
    print $fh $content;
    seek $fh, 0, 0;

    my ($fh2, $filename2) = tempfile();
    my $img = Image::Magick->new;
    if(my $err = $img->Read(file => \$fh))
    {   # cannot be converted into an image
        return undef;
    }
    else
    {   $img->Resize(geometry => '1024x1024>');
        $img->AutoOrient;
        seek $fh, 0, 0;
        $img->Write(file => \$fh);
    }
    seek $fh, 0, 0;

    send_file( $fh, content_type => $point->file_mimetype);
};

get '/thumbnail/:id' => sub {
    my $point = schema->resultset('Point')->find(route_parameters->get('id'))
        or return undef;

    send_file( \($point->thumbnail), content_type => $point->file_mimetype);
};

get '/points' => sub {
    my @return;
    foreach my $point (schema->resultset('Point')->search({},{
        columns => ['me.id', 'me.lat', 'me.long', 'me.comment', 'me.file_mimetype', 'me.thumbnail_width', 'me.thumbnail_height']
    })->all)
    {
        push @return, {
              type       => "Feature",
              geometry   => {
                type        => "Point",
                coordinates => [$point->long, $point->lat],
              },
              properties => $point->as_hash,
        };
    }
    content_type 'application/json';
    encode_json {
        type     => "FeatureCollection",
        features => \@return,
    };
};

post '/submit' => sub {

    content_type 'application/json';

    my $params;

    if (my $upload = upload('file'))
    {
        my $file_content = $upload->content; # Grab original image first

        my $img = Image::Magick->new;
        if(my $err = $img->Read($upload->tempname))
        {   # cannot be converted into an image
            return encode_json {
                is_error => 1,
                message  => "The uploaded file could not be recognised as an image",
            };
        }
        else
        {   $img->Resize(geometry => '512x512>');
            $img->AutoOrient;
            $img->Write($upload->tempname);
        }

        my $thumbnail = read_file $upload->tempname;
        my ($width, $height) = imgsize(\$thumbnail);
        $params = {
            file_name        => $upload->filename,
            file_mimetype    => $upload->type,
            file_content     => $file_content,
            thumbnail        => $thumbnail,
            thumbnail_width  => $width,
            thumbnail_height => $height,
        };
    }

    $params->{lat}     = body_parameters->get('lat');
    $params->{long}    = body_parameters->get('long');
    $params->{comment} = body_parameters->get('comment');

    my $point = schema->resultset('Point')->create($params);

    return encode_json $point->as_hash;
};

true;
