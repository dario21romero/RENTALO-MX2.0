*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     OperatingSystem

*** Variables ***


*** Keywords ***

Crear Cuentas de Usuario
    [Arguments]   ${scenario}   ${searchitem}	${link}     ${name}     ${email}	${password}     ${confirmpassword} 
    Ir a Crear Cuenta
    Cargar Datos de Cuenta de Usuario   ${scenario}   ${searchitem}	${link}     ${name}     ${email}	${password}     ${confirmpassword} 


Ir a Crear Cuenta
    Element Should be Visible   xpath=//a[@href="/signup"]
    Click Link      xpath=//a[@href="/signup"]

Cargar Datos de Cuenta de Usuario
    [Arguments]   ${scenario}   ${searchitem}	${link}     ${name}     ${email}	${password}     ${confirmpassword}  
    #Wait Until Page Contains  ${searchitem}
    Input Text    //input[@id='name']    ${name}
    Input Text    //input[@id='email']    ${email}
    Input Text    //input[@id='password']    ${password}
    Input Text    //input[@id='password_confirmation']    ${confirmpassword}
    Click Button    xpath=//*[@id="login"]/div/div/form/div[5]/button
    Capture Page Screenshot