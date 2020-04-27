package Traffic;

use Dancer2;
use Dancer2::Plugin::DBIC;

get '/' => sub {
    template 'index' => { 'title' => 'Traffic' };
};

get '/image/:id' => sub {
    my $point = schema->resultset('Point')->find(route_parameters->get('id'))
        or return undef;
    send_file( \($point->file_content), content_type => $point->file_mimetype);
};

get '/points' => sub {
    my @return;
    foreach my $point (schema->resultset('Point')->search({},{
        columns => ['me.id', 'me.lat', 'me.long', 'me.comment', 'me.file_mimetype']
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
    header "Access-Control-Allow-Origin" => "*";
    encode_json {
        type     => "FeatureCollection",
        features => \@return,
    };
};

post '/submit' => sub {

    my $params;

    if (my $upload = upload('file'))
    {
        $params = {
            file_name     => $upload->filename,
            file_mimetype => $upload->type,
            file_content  => $upload->content,
        };
    }

    $params->{lat}     = body_parameters->get('lat');
    $params->{long}    = body_parameters->get('long');
    $params->{comment} = body_parameters->get('comment');

    my $point = schema->resultset('Point')->create($params);

    header "Access-Control-Allow-Origin" => "*";
    content_type 'application/json';
    return encode_json $point->as_hash;
};

true;
