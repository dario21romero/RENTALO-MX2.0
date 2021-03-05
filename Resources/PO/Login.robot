*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     OperatingSystem

*** Variables ***


*** Keywords ***

Acceder a la Cuenta de Usuario
    [Arguments]   ${scenario}	    ${searchitem}	    ${link}	    ${email}	${password}	    ${searchitem2}
    Ir a Iniciar Sesion
    Cargar Datos de Iniciar Sesion  ${scenario}	    ${searchitem}	    ${link}	    ${email}	${password}	    ${searchitem2}
    Verificar Acceso    ${searchitem2}


Ir a Iniciar Sesion
    Element Should be Visible   xpath=//a[@href="/login"]
    Click Link      xpath=//a[@href="/login"]


Cargar Datos de Iniciar Sesion
    [Arguments]   ${scenario}	    ${searchitem}	    ${link}	    ${email}	${password}	    ${searchitem2}
    Input Text    //input[@id='email']    ${email}
    Input Text    //input[@id='password']    ${password}
    Click Button    xpath=//*[@id="login"]/div/div/form/div[3]/button
    Capture Page Screenshot


Verificar Acceso
    [Arguments]   	    ${searchitem2}
    Wait Until Page Contains    ${searchitem2}
    Capture Page Screenshot