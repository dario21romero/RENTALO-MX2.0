*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Keywords ***
Cargar Website
    Go To  ${START_URL}
    Maximize Browser Window 

Verificar Website cargado
    Wait Until Page Contains  ${HOMEPAGE_TITLE}


Cargar Website Docker
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    no-sandbox
    Call Method    ${chrome_options}   add_argument    disable-dev-shm-usage
    ${options}=     Call Method     ${chrome_options}    to_capabilities

    #Open Browser  ${START_URL}   Chrome  
    Go To  ${START_URL}
    #desired_capabilities=${options}