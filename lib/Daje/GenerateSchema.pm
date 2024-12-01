use v5.40;
use feature 'class';
no warnings 'experimental::class';

our $VERSION = '0.01';

class Daje::GenerateSchema :isa(Daje::Generate::Base::Common) {
    use Mojo::JSON qw{to_json};
    use Daje::Generate::Perl::CreateSchema;
    use Mojo::Pg;

    method process () {
        $self->_load_config();
        my $schema = $self->_load_db_schema();
        my $json = $self->_build_json($schema);
        $self->_save_json($json);

        return 1;
    }

    method _load_db_schema() {
        my $connection = $self->config->{DATABASE}->{connection};
        my $pg = Mojo::Pg->new->dsn($connection);

        my $dbschema = Daje::Generate::Perl::CreateSchema->new(
            db => $pg->db
        )->get_db_schema('public');

        return $dbschema;
    }

    method _build_json($schema) {
        my $json = to_json($schema);

        return $json;
    }

    method _save_json($json) {

        my $path = $self->config->{DATABASE}->{output_dir};
        open(my $fh, ">", $path . 'schema.json')
            or die "could not open $path . 'schema.json";
        print $fh $json;
        close $fh;

    }
}
1;


#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

lib::Daje::GenerateSchema - lib::Daje::GenerateSchema


=head1 DESCRIPTION

pod generated by Pod::Autopod - keep this line to make pod updates possible ####################


=head1 REQUIRES

L<Mojo::Pg> 

L<Daje::Generate::Perl::CreateSchema> 

L<Mojo::JSON> 

L<feature> 

L<v5.40> 


=head1 METHODS


=cut

