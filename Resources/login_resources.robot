*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}        https://rentalo.com.mx/login
${BROWSER}          chrome
${CREDENCIALES}     Las credenciales son incorrectas.

*** Keywords ***
Open my Browser
    Open Browser    ${LOGIN URL}    browser=${BROWSER}
    Set Window Position    0    0
    Set Window Size    960    1000

Close Browsers
    Close All Browsers

Open Login Page
    Go To    ${LOGIN URL}

Input username
    [Arguments]    ${username}
    Input Text    id=username    ${username}

Input pwd
    [Arguments]    ${password}
    Input Password    id=password    ${password}

click login button
    Click Button    xpath=//*[@id="login"]/div/div/form/div[3]/button

welcome page should be visible
    Title Should Be    Rentalo

Error page should be visible
    #Title Should Be    Error Page
    Page Should Contain     ${CREDENCIALES}