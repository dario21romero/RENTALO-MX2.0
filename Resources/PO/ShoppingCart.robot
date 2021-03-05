*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     OperatingSystem

*** Variables ***
${TAG_delivery} =   Datos de entrega

*** Keywords ***
Verificar Productos Agregados
    Wait Until Page Contains  ${TAG_delivery}

Proceed to Checkout
    Click Link  id=hlb-ptc-btn-native

