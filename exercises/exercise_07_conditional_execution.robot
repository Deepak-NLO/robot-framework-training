*** Settings ***
Documentation    Exercise 07 - Conditional execution
Library          SeleniumLibrary
Test Setup       Open And Maximize  ${HOMEPAGE}  ${BROWSER}
Test Teardown    Close Browser
Resource         ../answers/common_keywords.robot

*** Variables ***
${HOMEPAGE}  http://parabank.parasoft.com
${BROWSER}   Chrome

*** Test Cases ***
### Exercise 1
# Add a test case that:
# 1. Logs in (using the 'Log In As' keyword) as user 'john' with password 'demo'
# 2. Retrieves the number of accounts for John (using the 'Get Number Of Accounts' keyword)
#    and stores this in a variable
# 3. Writes 'John has multiple accounts' to the log if the number of accounts is higher than 1,
#    or writes 'John has only a single account' to the log, otherwise (use the 'Log' keyword).

### Exercise 2
# Add another test case that does the same as Exercise 1, but now for user 'parasoft' with password 'demo'

Verify the number of accounts for John
    Log In As   john    demo
    ${noOfAccounts}=    Get Number Of Accounts
    Run Keyword If      ${noOfAccounts} > 1     Log     John has multiple accounts
    ...     ELSEIF      ${noOfAccounts} = 1     Log     John has only a single account
    ...     ELSE        Log  John has no accounts

Verify the number of accounts for Parasoft
    Log In As   parasoft    demo
    ${noOfAccounts}=    Get Number Of Accounts
    Run Keyword If      ${noOfAccounts} > 1     Log     Parasoft has multiple accounts
    ...     ELSEIF      ${noOfAccounts} = 1     Log     Parasoft has only a single account
    ...     ELSE        Log  Parasoft has no accounts

*** Keywords ***
Log In As
    [Arguments]  ${username}  ${password}
    Wait And Type  name:username  ${username}
    Wait And Type  name:password  ${password}
    Wait And Click  xpath://input[@value='Log In']

Get Number Of Accounts
    ${number_of_accounts}=  Wait And Get Element Count  xpath://table[@id='accountTable']//a
    [Return]  ${number_of_accounts}
