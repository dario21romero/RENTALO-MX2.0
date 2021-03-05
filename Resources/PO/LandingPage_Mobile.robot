*** Settings ***
#Library  SeleniumLibrary
Library           AppiumLibrary
Library           DateTime
Library           OperatingSystem

*** Variables ***
${PLATFORM_NAME}    =   Android

*** Keywords ***
Cargar Website Mobile
    #Open Application    http://localhost:4723/wd/hub    platformName=Android    browserName=Chrome      deviceName=Pixel_3a_API_30_x86
    #Switch to Context   CHROMIUM
    Go To Url   https://develop.rentalo.com.mx/

Verificar Website cargado
    
    Wait Until Page Contains  ${HOMEPAGE_TITLE}