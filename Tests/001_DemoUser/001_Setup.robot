*** Settings ***
Documentation    This module is to test the demo user page of JR eCommerce page 
Resource    ../../Resources/commons/commons.resource
Resource    ../../Resources/DemoUser/001_Setup.resource


*** Test Cases ***
User registration
    commons.setup the browser
    commons.Go to customer login/signup page of demo application
    Select Window    NEW
    001_Setup.select registration page
    commons.generate new data with faker library
    001_Setup.enter generated details in signup form
    
