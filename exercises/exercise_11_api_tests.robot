*** Settings ***
Documentation    An example of using Robot Framework - Requests
### Exercise 1
# Import the RequestsLibrary library
Library  RequestsLibrary
Library  Collections
### Exercise 3
# Import the Collections library

*** Variables ***
${baseURL}=     http://api.zippopotam.us

*** Test Cases ***
### Exercise 2
# Add a test case that performs these steps:
# - Create a session for http://api.zippopotam.us
# - Perform a GET request to /us/90210
# - Check that the response HTTP status code equals 200
Validate if /us/90210 returns success code 200
    Create Session   requestSpec    ${baseURL}
    ${response}=     Get Request     requestSpec     /us/90210
    Status should be    200     ${response}


### Exercise 4
# Building on the result from Exercise 2,
# convert the JSON response body to a dictionary and
# extract the ‘country’ element into a variable
# Check that its value equals ‘United States’
Validate if country fetched is United States
    Create Session   requestSpec    ${baseURL}
    ${response}=     Get Request     requestSpec     /us/90210
    ${country}=      Get from Dictionary    ${response.json()}  country
    ${place}=        Get from Dictionary    ${response.json()['places'][0]}   state
    Should be equal     ${country}      United States

*** Keywords ***
