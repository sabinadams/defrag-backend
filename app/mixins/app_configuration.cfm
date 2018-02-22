<cfscript>

    // Loads all the application-scope variables
    public void function initializeApplicationVariables() {
        // Creates a dao instance in the application scope
        application.dao = new com.database.dao();
        // Creates global services
        application.auth = new services.authService();
        // Whitelisted Routes
        application.whitelist = [
            '/env'
        ];
        // Sets a "dev-mode indicator"
        application.isDev = cgi.server_name == 'localhost';
        // Defines status codes
        application.status_codes = {
            'success': 200,
            'bad_request': 400,
			'not_authorized': 401,
			'forbidden': 403,
            'not_found': 404, 
            'server_error': 500
        };

        // Environment-Specific Setup
		if( application.isDev ){
			//Local Development Server
		} else{
			//Production Server
		}

    }

    // Returns the configuration for Taffy framework
    public struct function getTaffyConfig() {
        return  {
            reloadKey = 'reboot',
            reloadPassword = 'makeithappen',
            disabledDashboardRedirect = '/',
            debugKey = 'debugonly', 
            environments = {
                development: {
                    disableDashboard = false
                },
                production: {
                    disableDashbaord = true
                }
            }
        };
    }

    // Called by Taffy to set up the 'environments' key in variables.framework (needs to be here)
    public function getEnvironment() {
        return cgi.server_name == 'localhost' ? 'development' : 'production'; 
    }

</cfscript>