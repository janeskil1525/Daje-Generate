use v5.40;
use feature 'class';
no warnings 'experimental::class';


class Daje::Generate::Base::Common {
    use Config::Tiny;
    use Daje::Generate::Tools::Datasections;

    field $config :reader;
    field $config_path :param :reader;

    method _load_config () {

        try {
            $config = Config::Tiny->read($config_path);
        } catch ($e) {
            die "Could not load config '$e";
        };

        return;
    }

    method _load_templates($source, $datasections) {
        my $template;
        try {
            $template = Daje::Generate::Tools::Datasections->new(
                data_sections => $datasections,
                source        => $source
            );
            $template->load_data_sections();
        } catch ($e) {
            die "load_templates failed '$e";
        };

        return $template;
    }

}
1;

#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

lib::Daje::Generate::Base::Common - lib::Daje::Generate::Base::Common


=head1 DESCRIPTION

pod generated by Pod::Autopod - keep this line to make pod updates possible ####################


=head1 REQUIRES

L<Daje::Generate::Tools::Datasections> 

L<Config::Tiny> 

L<feature> 

L<v5.40> 


=head1 METHODS


=cut
