Feature: Connect

    The Cat Tracker should connect to the AWS IoT broker

    Background:
        
        Given I am run after the "Run the firmware" feature
        Given I am authenticated with AWS key "{awsAccessKeyId}" and secret "{awsSecretAccessKey}"

    Scenario: Read reported state

        When I execute "getThingShadow" of the AWS IotData SDK with
        """
        {
            "thingName": "{jobId}"
        }
        """
        And I parse "awsSdk.res.payload" into "shadow"
        Then "shadow.state.reported" should match this JSON
        """
        {
            "dev": {
                "v": {
                    "modV": "mfw_nrf9160_1.2.2",
                    "brdV": "nrf9160dk_nrf9160",
                    "appV": "{appVersion}-upgraded"
                }
            },
            "cfg": {
                "gpst": 60,
                "act": true,
                "actwt": 60,
                "mvres": 60,
                "mvt": 3600,
                "acct": 100
            }
        }
        """