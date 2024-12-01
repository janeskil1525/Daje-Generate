use v5.40;
use feature 'class';
no warnings 'experimental::class';

our $VERSION = '0.01';

class Daje::Generate::Tools::FileChanged {
    use Digest::SHA qw(sha256_hex);
    use Mojo::File;

    method is_file_changed($file_path_name, $old_hash) {
        my $result = 0;
        my $path = Mojo::File->new($file_path_name);
        my $new_hash = $self->load_new_hash($path);
        $old_hash = "" unless defined $old_hash;
        if ($new_hash ne $old_hash) {
            $result = 1;
        }
        return $result;
    }

    method load_new_hash($path) {
        my $file_content = $path->slurp;
        my $hash = sha256_hex($file_content);
        return $hash;
    }
}


1;




#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

lib::Daje::Generate::Tools::FileChanged - lib::Daje::Generate::Tools::FileChanged


=head1 DESCRIPTION

pod generated by Pod::Autopod - keep this line to make pod updates possible ####################


=head1 REQUIRES

L<Mojo::File> 

L<Digest::SHA> 

L<feature> 

L<v5.40> 


=head1 METHODS


=cut

