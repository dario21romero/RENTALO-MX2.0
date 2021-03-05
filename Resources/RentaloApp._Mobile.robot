*** Settings ***
Library           DataDriver
# notice we're no longer referencing the Selenium2Library in our script!
Resource  ../Resources/search_resources_Mobile.robot
Resource  ../Resources/PO/LandingPage_Mobile.robot
Resource  ../Resources/PO/TopNav.robot
Resource  ../Resources/PO/SearchResults.robot
Resource  ../Resources/PO/Product.robot
Resource  ../Resources/PO/Cart.robot
Resource  ../Resources/PO/SignIn.robot


*** Keywords ***
#Busqueda de Maquina - Scenario 1
    #LandingPage.Cargar Website
    #LandingPage.Verificar Website cargado
    #TopNav.Buscar producto
    #SearchResults.Retorna producto seleccionado

#Seleccionar un producto desde el resultado de busqueda
    #SearchResults.Click Product link
    #Product.Verify Page Loaded

#Agregar un producto al Shopping cart
    #Product.Add to Cart
    #Cart.Verify Product Added

#Iniciar el checkout
    #Cart.Proceed to Checkout
    #SignIn.Verify Page Loaded


