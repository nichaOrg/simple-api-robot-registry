*** Settings ***
Library           RequestsLibrary

*** Test Cases ***

GET /plus/10/20
    ${response}    GET    http://192.168.50.61:5000/plus/10/20
    Should Contain    ${response.content.decode('utf-8')}    10 + 20 = 30

GET /plus/0/20.5
    ${response}    GET    http://192.168.50.61:5000/plus/0/20
    Should Contain    ${response.content.decode('utf-8')}    0 + 20 = 20

GET /plus/-10/0
    ${response}    GET    http://192.168.50.61:5000/plus/-10/0
    Should Contain    ${response.content.decode('utf-8')}    -10 + 0 = -10

GET /is_prime/17
    ${response}    GET    http://192.168.50.61:5000/is_prime/17
    Should Contain    ${response.content.decode('utf-8')}    true

GET /is_prime/36
    ${response}    GET    http://192.168.50.61:5000/is_prime/36
    Should Contain    ${response.content.decode('utf-8')}    false

GET /is_prime/13219
    ${response}    GET    http://192.168.50.61:5000/is_prime/13219
    Should Contain    ${response.content.decode('utf-8')}    true

GET /avg/10/5
    ${response}    GET    http://192.168.50.61:5000/avg/10/5
    Should Contain    ${response.content.decode('utf-8')}    7.5
GET /power/2/0
    ${response}    GET    http://192.168.50.61:5000/power/2/0
    Should Contain    ${response.content.decode('utf-8')}    1
GET /power/3/2
    ${response}    GET    http://192.168.50.61:5000/power/3/2
    Should Contain    ${response.content.decode('utf-8')}    9

GET /power/2/-2
    ${response}    GET    http://192.168.50.61:5000/power/2/-2
    Should Contain    ${response.content.decode('utf-8')}    0.25

GET /multiply/5/5
    ${response}    GET    http://192.168.50.61:5000/multiply/5/5
    Should Contain    ${response.content.decode('utf-8')}    25

GET /multiply/2/9
    ${response}    GET    http://192.168.50.61:5000/multiply/2/9
    Should Contain    ${response.content.decode('utf-8')}    18

GET /More1000/999
    ${response}    GET    http://192.168.50.61:5000/More1000/999
    Should Contain    ${response.content.decode('utf-8')}    this result is True

GET /More1000/990.9
    ${response}    GET    http://192.168.50.61:5000/More1000/990.9
    Should Contain    ${response.content.decode('utf-8')}    this result is True

*** Keywords ***

Get On Session
    [Arguments]    ${url}
    ${response}    GET    ${url}
    RETURN    ${response}
