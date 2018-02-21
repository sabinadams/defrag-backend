component extends="taffy.core.resource" taffy_uri="/whoami" {

    function get() {
        return representationOf({
            'message': "I found you based on your token!",
            'env': application.isDev ? 'dev' : 'prod',
            'user': request.user
        }).withStatus(200);
    }

}