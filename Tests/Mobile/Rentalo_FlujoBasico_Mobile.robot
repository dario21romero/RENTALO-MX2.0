*** Settings ***
Documentation  Suite de pruebas para Rentalo.com.mx
Library           DataDriver    file=RENTALO_MX.xlsx    sheet_name=VALIDOS
Library           AppiumLibrary
Library           DateTime
Library           OperatingSystem
# notice we're no longer referencing the Selenium2Library in our script!
Resource  ../../Resources/search_resources_mobile.robot
Resource  ../../Resources/PO/LandingPage_Mobile.robot
Resource  ../../Resources/Common_mobile.robot  # necessary for Setup & Teardown
Test Setup  Begin Web Test
Test Teardown  End Web Test

Test Template   Busqueda


*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://developer.rentalo.com.mx/
${HOMEPAGE_TITLE} =  Rentalo
${PLATFORM_NAME}    =   Android


# Copy/paste the below line to Terminal window to execute
# robot -d results tests/Rentalo.robot

*** Test Cases ***
Buscar - usando   ${machinename}     ${machinelink}


*** Keywords ***
Busqueda
    [Arguments]    ${machinename}    ${machinelink}
    LandingPage_Mobile.Cargar Website Mobile
    #Go To Url   https://rentalo.com.mx/
    LandingPage_Mobile.Verificar Website cargado
    search_resources_mobile.Insertar Nombre de Máquina completo    ${machinename}
    search_resources_mobile.El buscador despliega opciones para autocompletar       ${machinename}     ${machinelink}
    search_resources_mobile.Seleccionar opción del nombre desplegado  ${machinelink}
    search_resources_mobile.Retorna Informacion del producto       ${machinename}





    
