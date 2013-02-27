package MyApp::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

MyApp::Controller::Root - Root Controller for MyApp

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut
sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    if ( $c->user_exists) { # (1) ログイン状態を判断
        $c->response->body( $c->user->get('twitter_user').' is logged in.' ); # (2) ログインユーザーのTwitterユーザー名を取得
    } else {
        $c->response->body( 'not login.' );
    }
}

sub logout :Local { # (3) ログアウト処理を実装
    my ( $self, $c ) = @_;
    $c->logout();
    $c->response->redirect($c->uri_for('/'));
}


=head2 default

Standard 404 error page

=cut
sub login : Local {
    my ($self, $c) = @_;
   
    my $realm = $c->get_auth_realm('twitter');
    $c->res->redirect( $realm->credential->authenticate_twitter_url($c) ); # (1)
}
sub callback : Local {
    my ($self, $c) = @_;
   
    if (my $user = $c->authenticate(undef,'twitter')) { # (1) 認証処理
        $c->res->redirect("/"); # (2) 認証成功したら / にリダイレクト
    }
    else {
        die 'login error.'; # (3) 認証失敗したらdie。
    }
}
sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

th4,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
