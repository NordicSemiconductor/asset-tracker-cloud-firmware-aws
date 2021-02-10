Feature: Run the firmware

    The Cat Tracker should run the firmware

    Scenario: The firmware should have been run

        Given the Firmware CI job "{jobId}" has completed
        Then the Firmware CI device log for job "{jobId}" should contain
        """
        aws_iot_integration.cloud_wrap_init:  The Asset Tracker v2 has started
        aws_iot_integration.cloud_wrap_init:  Version:     {appVersion}-original
        aws_iot_integration.cloud_wrap_init:  Client ID:   {jobId}
        aws_iot_integration.cloud_wrap_init:  Cloud:       AWS IoT
        aws_iot_integration.cloud_wrap_init:  Endpoint:    {mqttEndpoint}
        """