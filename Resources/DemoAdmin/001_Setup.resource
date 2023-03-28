*** Settings ***
Library    SeleniumLibrary
Resource    ../commons/commons.resource    
Variables    001_Setup.py
Library    custompyLibrary.compareItems
Library    custompyLibrary.compareItemsText
Library    ExperimentalLibrary.iteratePage



*** Keywords ***
go to demoadmin page
    commons.Click Element    ${adminpanel}
    
test setup for admin
    commons.setup the browser
    001_Setup.go to demoadmin page
    Select Window    NEW
    Element Should Be Enabled    ${usernamelocator}
    commons.Input Text    ${usernamelocator}    ${usernameadmin}
    commons.Input Text    ${passwordlocator}    ${passwordadmin}
    commons.Click Element    ${loginbtnadmin}
    Page Should Contain    ${dashboardtxt}    
    
teardown for admin
    commons.Click Element    ${logoutadmin}
    Close All Browsers
    
verify products are present
    commons.Click Element    ${admin_catalog}
    commons.Click Element    ${admin_products}
    @{productsFromAdminPanelPage1}=    Create List    Boys Kurta Pajama    Girls Lehenga Choli
    custompyLibrary.compareItems.Compare Items In Admin Panel    ${productsFromAdminPanelPage1}
    
verify categories
    commons.Click Element    ${admin_catalog}
    commons.Click Element    ${admin_categories}
    
    @{categoriesFromAdminPanelPage1}=    Create List    Diamond rings    Diamond rings\u00a0\u00a0>\u00a0\u00a0Men's    Diamond rings\u00a0\u00a0>\u00a0\u00a0Men's\u00a0\u00a0>\u00a0\u00a0Shoes    Diamond rings\u00a0\u00a0>\u00a0\u00a0Women's    Examples    Kids    Kids\u00a0\u00a0>\u00a0\u00a0Accessories    Kids\u00a0\u00a0>\u00a0\u00a0Fashion    Kids\u00a0\u00a0>\u00a0\u00a0Toys & Games    Men    Men\u00a0\u00a0>\u00a0\u00a0Accessories    Men\u00a0\u00a0>\u00a0\u00a0Fashion    	Men\u00a0\u00a0>\u00a0\u00a0Jewelry    Women    Women\u00a0\u00a0>\u00a0\u00a0Accessories    Women\u00a0\u00a0>\u00a0\u00a0Fashion    Women\u00a0\u00a0>\u00a0\u00a0Fashion\u00a0\u00a0>\u00a0\u00a0Kurti    Women\u00a0\u00a0>\u00a0\u00a0Fashion\u00a0\u00a0>\u00a0\u00a0Lehenga    Women\u00a0\u00a0>\u00a0\u00a0Fashion\u00a0\u00a0>\u00a0\u00a0Saree    Women\u00a0\u00a0>\u00a0\u00a0Jewelry
    custompyLibrary.compareItemsText.Compare Items In Admin Panel Text    ${categoriesFromAdminPanelPage1}
    
verify products across all page
    commons.Click Element    ${admin_catalog}
    commons.Click Element    ${admin_products}
    @{allProducts}=    Create List    	Boys Kurta Pajama    Girls Lehenga Choli    	Gold plated jewelry set    Jewelry    The Lyra Pendant    Wholesale Product (Read description below)	
    ${values}=    create list    56    50    60    48    61    28
    ExperimentalLibrary.iteratePage.Iterate Through Values    ${allProducts}    ${values}
    commons.Click Element    ${deletebtn}
    Handle Alert    ACCEPT
    Wait Until Element Is Visible    ${deletealert}    
    Page Should Contain Element    ${deletealert}    