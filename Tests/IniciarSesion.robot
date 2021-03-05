*** Settings ***
Documentation  Suite de pruebas para Rentalo.com.mx
Library           DataDriver    file=RENTALO_MX.xlsx    sheet_name=INICIARSESION
Library     SeleniumLibrary
# notice we're no longer referencing the Selenium2Library in our script!
#Resource  ../Resources/search_resources.robot
Resource    ../Resources/search_resources.robot
Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/RentaloApp.robot  # necessary for lower level keywords in test cases
Resource  ../Resources/PO/LandingPage.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

Test Template   Log In


*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://develop.rentalo.com.mx/
${HOMEPAGE_TITLE} =  Rentalo


# Copy/paste the below line to Terminal window to execute
# robot -d results tests/Rentalo.robot

*** Test Cases ***

Iniciar Sesion      ${scenario}	    ${searchitem}	    ${link}	    ${email}	${password}	    ${searchitem2}
    

*** Keywords ***
Log In
    [Arguments]   ${scenario}	    ${searchitem}	    ${link}	    ${email}	${password}	    ${searchitem2}
    RentaloApp.Iniciar Sesion de Usuario   ${scenario}	    ${searchitem}	    ${link}	    ${email}	${password}	    ${searchitem2}

    