
use strict;
use warnings;

use Data::Dumper;

use YAML;
use Template;

my $template = Template->new( {
    INCLUDE_PATH    => "./templates",
}) or die "Cant create the Template Object\n";

my $index = 1;
for my $file ( <"./examples/*.yaml"> ){

    open my $fh, "<", $file;
        local $/;
        my $example = <$fh>;
    close $fh;
    
    my ( $data ) = Load( $example );

    $data->{ next } = ( 1 +  $index );

    $template->process(
        "index.t2t", 
        $data,
        "$index.html"
    );
    $index++;
}

