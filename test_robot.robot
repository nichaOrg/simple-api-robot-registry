*** Settings ***
Library           RequestsLibrary

*** Test Cases ***

GET /mul5/1
    ${response}    GET    http://127.0.0.1:5000/mul5/1
    Should Contain    ${response.content.decode('utf-8')}    5

GET /mul5/-10
    ${response}    GET    http://127.0.0.1:5000/mul5/-10
    Should Contain    ${response.content.decode('utf-8')}    -50
GET /mul5/1.5
    ${response}    GET    http://127.0.0.1:5000/mul5/1.5
    Should Contain    ${response.content.decode('utf-8')}    7.5
    
*** Keywords ***

Get On Session
    [Arguments]    ${url}
    ${response}    GET    ${url}
    RETURN    ${response}
