#!/usr/bin/perl
use FindBin;
BEGIN { unshift @INC, "$FindBin::Bin/../lib" }

use v5.40;
use Moo;
use MooX::Options;
use Cwd;

use feature 'say';
use feature 'signatures';
use Daje::GenerateSchema;

use namespace::clean -except => [qw/_options_data _options_config/];

option 'configpath' => (
    is 			=> 'ro',
    required 	=> 1,
    reader 		=> 'get_configpath',
    format 		=> 's',
    doc 		=> 'Configuration file',
    default 	=> '/home/jan/Project/SyntaxSorcery/Tools/Generate/conf/generate_schema.ini'
);


sub generate_schema ($self) {

    my $config_path;
    try  {
        $config_path = $self->get_configpath();
    } catch($e) {
        die "Could not get config path '$e'";
    };

    try {
        my $sql_generator = Daje::GenerateSchema->new(
            config_path => $config_path
        )->process();
    } catch ($e) {
        die "Could not generate schema '$e";
    };

}

main->new_with_options->generate_schema();

1;