component extends='taffy.core.api' {
    // Config
    this.name = hash(getCurrentTemplatePath()); 
    this.sessionManagement = true; 
    this.datasource = 'defrag';

    // File Includes
    include '/includes/app_configuration.cfm';

    //Taffy Framework configuration
	variables.framework = getTaffyConfig();

    // Called by Taffy to set up the 'environments' key in variables.framework (needs to be here)
    public function getEnvironment() { 
        return cgi.server_name == 'localhost' ? 'development' : 'production'; 
    }

    // Application Environment Setup and Data Loading
    public function onApplicationStart() {
        
        // This needs to come first 
        super.onApplicationStart();

        // Sets up Application Variables
        // This function creates DAO object, so DAO cannot be used before this
        initializeApplicationVariables();

    }
    
    public function onRequestStart(){ 
        super.onRequestStart();
    }

    // Runs on each API request
    public function onTaffyRequest( verb, cfc, requestArguments, mimeExt, headers ) {
        // Stop here if its Preflighted OPTIONS request
		if ( verb == "OPTIONS" ) return noData().withStatus( application.status_code.success, "OK" );
        
        // Whitelist endpoints that don't require authentication
		if ( application.whitelist.contains( requestArguments.endpoint ) ) return true;
        
        if (                                                   // Doesn't check for spaces before Bearer or between Bearer and the token 
            structKeyExists( headers, 'authorization' ) &&     // Request has authorization header
            listRest(headers[ 'authorization' ], ' ') != '' && // The token was present at the second index when broken into spaces
            headers[ 'authorization' ].indexOf("Bearer") == 0  // The first index when broken by spaces is "Bearer" 
        ) {
            // Attach token to request arguments if all the criteria were met
            requestArguments['token'] =  listRest( headers[ 'authorization' ], ' ' );
        }
		
        // If an Auth Token was not sent, send Authentication error
        if( !structKeyExists( requestArguments, "token" ) ) {
            return noData().withStatus( application.status_codes.not_authorized, "Not Authenticated" );
        }

        // Grab the user's MetaData using the token
        // Check the metadata for valid login flag. If the user is not logged in, return the error details stored in the metadata variable
        request.user = application.auth.authorize( token = requestArguments['token'] ); 
        if ( !request.user.logged_in ) {
            return noData().withStatus( application.status_codes.not_authorized, "Not Authorized");
        }
	    // If all checked out, allow the user to access the resource
        return true;    
    }
}
