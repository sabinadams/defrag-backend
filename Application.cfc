component extends="taffy.core.api" {

    //Taffy Framework configuration
	variables.framework = {
		reloadKey = "reboot",
		reloadPassword = "makeithappen",
		disableDashboard = false, //Change this to true to disable the Taffy Dashboard 
		disabledDashboardRedirect = "/",
		debugKey = "debugonly"
	};

    function onApplicationStart() {
        // This needs to come first --> (find out why) <--
        super.onApplicationStart();
        application.dao = new com.database.dao( dsn = "defrag" );
    }

}
