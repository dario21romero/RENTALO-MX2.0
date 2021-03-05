*** Settings ***
Documentation  Suite de pruebas para Rentalo.com.mx
Library           DataDriver    file=RENTALO_MX.xlsx    sheet_name=NO_VALIDOS
Library           AppiumLibrary
# notice we're no longer referencing the Selenium2Library in our script!
Resource  ../Resources/search_resources_mobile.robot
Resource  ../Resources/Common_mobile.robot  # necessary for Setup & Teardown
Resource  ../Resources/PO/LandingPage_Mobile.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

Test Template   Busqueda


*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://rentalo.com.mx/
${HOMEPAGE_TITLE} =  Rentalo


# Copy/paste the below line to Terminal window to execute
# robot -d results tests/Rentalo.robot

*** Test Cases ***
Buscar - usando   ${machinename} 
    

*** Keywords ***
Busqueda 
    [Arguments]    ${machinename} 
    LandingPage_Mobile.Cargar Website Mobile
    LandingPage_Mobile.Verificar Website cargado
    search_resources_mobile.Insertar Nombre de Máquina completo    ${machinename}
    search_resources_mobile.El buscador no muestra resultados


This is at the moment my working solution :(

  # ${passed}  ${value}    Run keyword And Ignore Error    Should Be Equal    1  2
  # Run Keyword If  "${passed}"=="FAIL"  Run keyword And Continue On Failure  FAIL
