*** Settings ***
Library           SeleniumLibrary

***Variables ***
${CATALOG_TAG}      Catálogo
${EMPTY_CATALOG}    No hay resultados con los parametros de busqueda
${EMPTY_LIST}       No hay resultados para
${CATEGORY_TAG}     Categorias

*** Keywords ***

Insertar Valor de Busqueda
    [Arguments]    ${machinename} 
    Clear Element Text     id=equipment-query
    Input Text    id=equipment-query    ${machinename}


Insertar Nombre de Máquina completo
    [Arguments]    ${machinename} 
    Clear Element Text     id=equipment-query
    Input Text    id=equipment-query    ${machinename}
    #sleep 5

El buscador despliega opciones para autocompletar
    [Arguments]    ${machinename}   ${categorylink}
    #
    #Wait Until Page Contains    ${machinename}
    #Wait Until Page Contains Element   css:[class="flex items-center p-4 hover:bg-gray-200"]
    #Capture Page Screenshot
    Wait Until Page Contains Element   xpath=//a[@href="${categorylink}"] 
    Capture Page Screenshot

Seleccionar opción del nombre desplegado
    [Arguments]    ${machinelink}
    Click Link  xpath=//a[@href="${machinelink}"]

El buscador no muestra resultados
    Wait Until Page Contains     ${EMPTY_LIST}      timeout=8.0
    Capture Page Screenshot

Presionar Enter
    Press Keys    //*[@id="equipment-query"]    ENTER

Presionar Boton de Busqueda
    Element Should be Visible   xpath=//*[@id="home"]/section[1]/div/div/div/div[1]/div
    Element Should Be Enabled   xpath=//*[@id="home"]/section[1]/div/div/div/div[1]/div
    Click Element   xpath=//*[@id="home"]/section[1]/div/div/div/div[1]/div
    #//*[@id="home"]/section[1]/div/div/div/div[1]/div/svg

Retorna Informacion del producto
    [Arguments]    ${itemInfo}
    Wait Until Page Contains  ${itemInfo}
    #Wait Until Page Contains Element    xpath=//html/body/div/div/div[2]/div[1]/div[2]/h2[1]
    #Get All Links
    Capture Page Screenshot
    Informacion del producto    ${itemInfo}

Informacion del producto
    [Arguments]    ${machinename}
    Wait Until Page Contains    ${machinename}

Retorna Catalogo de productos
    #Wait Until Page Contains  ${machinename}
    Wait Until Page Contains Element    xpath=//*[@id="catalog"]/div/div/h1
    #//*[@id="catalog"]/div[2]/div/h1
    Wait Until Page Contains    ${CATALOG_TAG}
    Capture Page Screenshot

Retorna Catalogo de productos vacio
    #Wait Until Page Contains  ${machinename}
    Wait Until Page Contains Element    xpath=//*[@id="catalog"]/div/div/h1
    #//*[@id="catalog"]/div[2]/div/h1
    Wait Until Page Contains    ${EMPTY_CATALOG}
    Page Should Not Contain Element     css:[class="block mb-8 rounded-lg border shadow-md overflow-hidden mx-auto"]
    Capture Page Screenshot

Retorna Busqueda en Catalogo de productos vacio
    #Wait Until Page Contains  ${machinename}
    Wait Until Page Contains Element    xpath=//*[@id="catalog"]/div/div/h1
    #//*[@id="catalog"]/div[2]/div/h1
    Wait Until Page Contains    ${EMPTY_CATALOG}
    #Page Should Not Contain Element     css:[class="block mb-8 rounded-lg border shadow-md overflow-hidden mx-auto"]
    Capture Page Screenshot

Seleccionar Categoria Equipo Mueve Tierra
    #Wait Until Page Contains Element    xpath=//*[@id="catalog"]/div[2]/div/h1
    Element Should be Visible   xpath=//a[@href="/category/equipo-ligero-y-herramietas"]
    Element Should Be Enabled   xpath=//a[@href="/category/equipo-ligero-y-herramietas"]
    Click Link  xpath=//a[@href="/category/equipo-ligero-y-herramietas"]

Buscar Seccion Categorias
    [Arguments]    ${categorylink}
    # Wait Until Page Contains     ${CATEGORY_TAG}
    #Element Should be Visible   xpath=//*[@id="home"]/section[2]/h2
    Wait Until Page Contains Element     xpath=//a[@href="${categorylink}"]
    Capture Page Screenshot
    Click Element  xpath=//a[@href="${categorylink}"]

Buscar Grupo
    [Arguments]     ${categoryname}     ${groupname}    ${itemlink}
    Wait Until Page Contains        ${categoryname}
    Page Should Contain Button      ${groupname}
    Wait Until Page Contains Element     xpath=//a[@href="${itemlink}"]
    Capture Page Screenshot
    #xpath=//*[@id="app"]/section/div[2]/div[1]/div/button[4] 

Retorna productos de la Categoria
    [Arguments]     ${machinename}  
    Wait Until Page Contains      ${machinename}    timeout=10.0
    Capture Page Screenshot


Seleccionar Producto de la Categoria
    [Arguments]     ${searchKey2}       ${link2}
    Wait Until Page Contains    ${searchKey2}      
    Click Element  xpath=//a[@href="${link2}"]
    Capture Page Screenshot