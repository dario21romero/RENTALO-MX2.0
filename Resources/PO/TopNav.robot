*** Settings ***
Documentation  Amazon top navigation
Library  SeleniumLibrary


*** Variables ***
${SEARCH_VALID_NAME} =  BOBCAT T590
${ITEM_BRIEF_DESC}  = Cargador Compacto
${ITEM_NAME} = BOBCAT T590
${IMAGE}
${ITEM_PRICE_RENT} = Precios de Renta
${ITEM_PRICE_DAILY} = Renta por Día
${ITEM_PRICE_WEEKLY} = Renta por Semana
${ITEM_PRICE_MONTHLY} = Renta por Mes
${ITEM_QTY} = 
${ITEM_DETAILS}
${DOWNLOAD_RELATED}


*** Keywords ***
Buscar producto
    Insertar Nombre de Máquina completo
    El buscador despliega opciones para autocompletar
    Seleccionar opción del nombre desplegado

    
Insertar Nombre de Máquina completo
     Input Text  id=equipment-query  ${SEARCH_VALID_NAME}
     Capture Page Screenshot

El buscador despliega opciones para autocompletar
    Wait Until Page Contains Element   css:[class="flex items-center p-4 hover:bg-gray-200"]
    Capture Page Screenshot

Seleccionar opción del nombre desplegado
    Click Link  xpath=//a[@href="/equipment/bobcat-t590"]
    
 
