#!/usr/bin/perl

use FindBin;
use lib "$FindBin::Bin/../lib";

use Dancer2;
use Dancer2::Plugin::DBIC;
use File::Slurp;
use Getopt::Long;

my ($type, $key, $file);

GetOptions (
    'type=s' => \$type,
    'file=s' => \$file,
    'key=s'  => \$key,
) or exit;

my $text = read_file($file);

schema->resultset('Layer')->create({
    key  => $key,
    type => $type,
    kml  => $text,
});

