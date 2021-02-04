Feature: Run the firmware

    The Cat Tracker should run the firmware

    Scenario: The firmware should have been run

        Given the Firmware CI job "{jobId}" has completed
        Then the Firmware CI device log for job "{jobId}" should contain
        """
        cat_tracker:  The cat tracker has started
        cat_tracker:  Version:     {appVersion}-original
        cat_tracker:  Client ID:   {jobId}
        cat_tracker:  Endpoint:    {mqttEndpoint}
        """