package Hubot::Scripts::hello;

use utf8;
use strict;
use warnings;

sub load {
    my ( $class, $robot ) = @_;
 
    $robot->hear(
        qr/^hello (.+)/i,    
        \&hello,
    );
}

sub hello {
    my $msg = shift;

    my $user_input = $msg->match->[0];

    $msg->http("http://translate.google.co.kr/#ko/en/$user_input")->get(
        sub {
            my ( $body, $hdr ) = @_;
            
            $msg->send($body);
        }
    );
}



1;

=pod

=head1 Name 

    Hubot::Scripts::weather
 
=head1 SYNOPSIS
 
    weather <city name>  - View current local area weather information. 
    weather weekly <city name> - View weekly local area weather information.
    weather weekly <city name1> <city name2>... - View weekly local areas weather information.
    weather forecast <local name> - View local weather forecast information. (ex: KangWon-Do, Gyeonggi-Do ..)

=head1 AUTHOR

    YunChang Kang <codenewb@gmail.com>
 
=cut
