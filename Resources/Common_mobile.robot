*** Settings ***
Library  AppiumLibrary

*** Variables ***

*** Keywords ***
Begin Web Test
     Open Application    http://localhost:4723/wd/hub    platformName=Android    browserName=Chrome      deviceName=Pixel_3a_API_30_x86
    # Maximize Browser Window

End Web Test
    Close Application