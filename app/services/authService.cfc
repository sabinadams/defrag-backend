/**
 * Provides Auth-related functions to the application.
 */
component extends="BaseService" displayname="AuthService" output="false" {
    
    /**
     * Authorizes a request by token and returns the user's Metadata
     */ 
    public struct function authorize( required string token ) {
        // Find an existing session with the provided token
        var sesh = new models.Session();
        sesh.lazyLoadByToken(token);
        if ( !sesh.isNew() ) {
            // Find an active user with that token's user association
            var user = new models.User();
            user.lazyLoad( sesh.getUser_ID() );

            if ( !user.isNew() && user.getActive() ) {
                // Update timestamps
                user.setTimestamp(now());
                user.save();
                sesh.setTimestamp(now());
                sesh.save();

                // Return user Metadata
                return {
                    'ID': user.getID(),
                    'name': user.getName(),
                    'token': sesh.getToken(),
                    'active': user.getActive(),
                    'logged_in': 1
                }
            }
        }
        // Session/User was not found or User was inactive. Return "Not logged in"
        return { 'logged_in': 0 };
    }
    
    /**
     * Authorizes a user based on an email and password. Returns user object with token
     */
    public struct function authorize( required string email, required string password ) {}
}