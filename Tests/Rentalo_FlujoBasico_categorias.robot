*** Settings ***
Documentation  Suite de pruebas para Rentalo.com.mx
Library           DataDriver    file=RENTALO_MX.xlsx    sheet_name=CATEGORIAS
# notice we're no longer referencing the Selenium2Library in our script!
Resource  ../Resources/search_resources.robot
Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/RentaloApp.robot  # necessary for lower level keywords in test cases
Resource  ../Resources/PO/LandigPage.robot
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
Buscar - usando   ${categorylink} 
    

*** Keywords ***
Busqueda
    [Arguments]    ${categorylink} 
    LandingPage.Cargar Website
    LandingPage.Verificar Website cargado
    search_resources.Buscar Seccion Categorias      ${categorylink}


