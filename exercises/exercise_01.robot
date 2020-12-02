*** Settings ***
Documentation   Login to Para Bank application
Library     SeleniumLibrary

*** Test Cases ***
Login to Para Bank
    Open Browser    http://parabank.parasoft.com/parabank/index.htm     Chrome
    Maximize Browser Window
    Input Text  name:username   john
    Input Text  name:password   demo
    Click element   //input[@value='Log In']
    Title Should Be     ParaBank | Accounts Overview
    Close Browser