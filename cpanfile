
requires 'Syntax::Keyword::Match', '0.15';
requires 'Mojo::JSON', '0';
requires 'Config::Tiny', '2.30';
requires 'Digest::SHA', '6.04';
requires 'Mojo::File', '0';
requires 'Syntax::Operator::Matches', '0';
requires 'String::CamelCase', '0';
requires 'Daje::Tools::Filechanged', '0';
requires 'Daje::Tools::Datasections', '0.08';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

