*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Retorna producto seleccionado
    Wait Until Page Contains  ${machinename}
    Wait Until Page Contains Element    xpath=//*[@id="app"]/div/div[2]/div[1]/div[1]/img
    Capture Page Screenshot

Retorna Catalogo de productos
    Wait Until Page Contains  ${machinename}
    Wait Until Page Contains Element    xpath=//*[@id="app"]/div/div[2]/div[1]/div[1]/img
    Get All Links
    Capture Page Screenshot