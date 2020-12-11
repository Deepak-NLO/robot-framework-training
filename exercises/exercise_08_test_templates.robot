*** Settings ***
Documentation    Exercise 08 - Test templates
Library          SeleniumLibrary
Test Setup       Open And Maximize  ${HOMEPAGE}  ${BROWSER}
Test Template    Log in to ParaBank and check if user has multiple accounts
Test Teardown    Close Browser
Resource         ../answers/common_keywords.robot

*** Variables ***
${HOMEPAGE}  http://parabank.parasoft.com
${BROWSER}   Chrome

*** Test Cases ***
### Exercise 1
# Convert these two tests into a templated test by:
# 1. Creating a custom keyword that runs the test (think about what you want to parameterize)
# 2. Defining this keyword as a Test Template
#    (can you find out how to use the username in the log statement, too?)
# 3. Specifying the iterations (test cases) in the *** Test Cases *** section


Check how many accounts does John has   john  demo

Check how many accounts does Parasoft has  parasoft  demo

*** Keywords ***
Log In As
    [Arguments]  ${username}  ${password}
    Wait And Type  name:username  ${username}
    Wait And Type  name:password  ${password}
    Wait And Click  xpath://input[@value='Log In']

Get Number Of Accounts
    ${number_of_accounts}=  Wait And Get Element Count  xpath://table[@id='accountTable']//a
    [Return]  ${number_of_accounts}


Log in to ParaBank and check if user has multiple accounts
     [Arguments]  ${username}  ${password}
     Log In As  ${username}  ${password}
     ${number_of_accounts}=  Get Number Of Accounts
     Run Keyword If  ${number_of_accounts} > 1  Log  User ${username} has multiple accounts
     ...  ELSE  Log  User ${username} has only a single account
     Wait And Click  xpath://a[text()='Log Out']
