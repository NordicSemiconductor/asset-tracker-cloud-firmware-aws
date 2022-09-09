Feature: The device should request A-GPS data

    Scenario: The device has received A-GPS data

        Then the Firmware CI run device log should contain
        """
        CLOUD_WRAP_EVT_AGPS_DATA_RECEIVED
        """