*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Begin Web Test 2
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    no-sandbox
    Call Method    ${chrome_options}   add_argument    disable-dev-shm-usage
    ${options}=     Call Method     ${chrome_options}    to_capabilities

    Open Browser  about:blank  ${BROWSER}   desired_capabilities=${options}
    #Open Browser  about:blank  chrome
     Maximize Browser Window

Begin Web Test
    Open Browser  about:blank  chrome
    Maximize Browser Window


End Web Test
    Close Browser
