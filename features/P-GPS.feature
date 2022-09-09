Feature: The device should request P-GPS data

    Scenario: The device has received P-GPS data

        Then the Firmware CI run device log should contain
        """
        CLOUD_WRAP_EVT_PGPS_DATA_RECEIVED
        """