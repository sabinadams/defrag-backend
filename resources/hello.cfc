component extends="taffy.core.resource" taffy_uri="/hello" {

    function get(){
        var sesh = application.dao.read( sql="SELECT * FROM sessions", returnType="array" );
        return representationOf(sesh).withStatus(200);
    }

}