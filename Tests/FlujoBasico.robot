*** Settings ***
Documentation  Suite de pruebas para Rentalo.com.mx
Library           DataDriver    file=RENTALO_MX.xlsx    sheet_name=FLUJOBASICO1
Library     SeleniumLibrary
# notice we're no longer referencing the Selenium2Library in our script!
#Resource  ../Resources/search_resources.robot
Resource    ../Resources/search_resources.robot
Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/RentaloApp.robot  # necessary for lower level keywords in test cases
Resource  ../Resources/PO/LandingPage.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

Test Template   Busqueda


*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://develop.rentalo.com.mx/
${HOMEPAGE_TITLE} =  Rentalo


# Copy/paste the below line to Terminal window to execute
# robot -d results tests/Rentalo.robot

*** Test Cases ***

Buscar Maquinaria  ${searchKey}     ${searchKey2}       ${link}      ${itemInfo}    ${itemInfo2}    ${scenario}
    

*** Keywords ***
Busqueda
    [Arguments]   ${searchKey}     ${searchKey2}       ${link}      ${itemInfo}    ${itemInfo2}    ${scenario}
    #Set Log Level   NONE
    RentaloApp.Buscar Maquinaria   ${searchKey}     ${searchKey2}       ${link}      ${itemInfo}    ${itemInfo2}    ${scenario}

    