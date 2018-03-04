component extends="taffy.core.resource" taffy_uri="/env" {

    function get() {
        return representationOf({
            'message': "Here's the environment!",
            'env': application.isDev ? 'dev' : 'prod',
            'server': cgi.server_name
        }).withStatus(200);
    }

}