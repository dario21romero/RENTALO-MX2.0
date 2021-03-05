*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${tag_ubicacion} =      Ubicacion: 
${tag_periodo}  =       Fechas:
${tag_remove_from_cart} =    Eliminar del carrito 


*** Keywords ***
Ingresar Ubicacion
    [Arguments]    ${location}      ${locationinfo}    
    Wait Until Page Contains  ${tag_ubicacion}
    Input Text        xpath=//*[@id="app"]/div/main/section/div[4]/div[1]/div[1]/div/span/input      ${location}
    #//*[@id="app"]/main/section/div[4]/div[1]/div[1]/div/span/input     ${location}
    Wait Until Page Contains    ${locationinfo}
    Capture Page Screenshot

Presionar Enter
    Press Keys    //*[@id="app"]/div/main/section/div[4]/div[1]/div[1]/div/span/input       ENTER

Seleccionar ubicacion
    [Arguments]    ${locationinfo}
    #Click Link  xpath=//a[@href="${locationinfo}"]
    Select From List By Value   ${locationinfo}

Ingresar periodo de renta
    [Arguments]      ${date1}	${date2}
    Wait Until Page Contains  ${tag_ubicacion}
    Input Text      xpath=//*[@id="app"]/div/main/section/div[4]/div[1]/div[3]/input[1]     ${date1}
    Input Text      xpath=//*[@id="app"]/div/main/section/div[4]/div[1]/div[3]/input[2]     ${date2}
    Capture Page Screenshot

Agregar al carrito de compras
    Click Button    xpath=//*[@id="app"]/div/main/section/div[4]/div[2]/div[4]/button[1]
    #Wait until Page Contains    ${tag_remove_from_cart}
    Capture Page Screenshot


Eliminar del carrito de compras
    Wait Until Page Contains    ${tag_remove_from_cart}
    Click Button    xpath=//*[@id="app"]/main/section/div[4]/div[2]/div[4]/button[2]
    #Wait until Page Contains    ${tag_remove_from_cart}
    Capture Page Screenshot    


Ir al Carrito de compras
    Click Link  xpath=//a[@href="/quote"]    



