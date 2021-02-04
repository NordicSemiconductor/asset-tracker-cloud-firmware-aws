Feature: Upgrade the firmware

    The Cat Tracker should have upgraded the firmware

    Scenario: The upgraded firmware should have been run

        Given the Firmware CI job "{jobId}" has completed
        Then the Firmware CI device log for job "{jobId}" should contain
        """
        cat_tracker:  Version:     {appVersion}-upgraded
        """