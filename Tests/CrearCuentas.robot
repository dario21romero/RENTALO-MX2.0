*** Settings ***
Documentation  Suite de pruebas para Rentalo.com.mx
Library           DataDriver    file=RENTALO_MX.xlsx    sheet_name=CREARCUENTAS
Library     SeleniumLibrary
# notice we're no longer referencing the Selenium2Library in our script!
#Resource  ../Resources/search_resources.robot
Resource    ../Resources/search_resources.robot
Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/RentaloApp.robot  # necessary for lower level keywords in test cases
Resource  ../Resources/PO/LandingPage.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

Test Template   Creacion


*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://develop.rentalo.com.mx/
${HOMEPAGE_TITLE} =  Rentalo


# Copy/paste the below line to Terminal window to execute
# robot -d results tests/Rentalo.robot

*** Test Cases ***

Crear Cuenta  ${scenario}   ${searchitem}	${link}     ${name}     ${email}	${password}     ${confirmpassword}
    

*** Keywords ***
Creacion
    [Arguments]   ${scenario}   ${searchitem}	${link}     ${name}     ${email}	${password}     ${confirmpassword}
    RentaloApp.Crear Cuenta de Usuario   ${scenario}   ${searchitem}	${link}     ${name}     ${email}	${password}     ${confirmpassword}

    