*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         JSONLibrary

*** Variables ***
${urlHost}                   https://skillacademy.com/
${enpoint}                   skillacademy/discovery/search

*** Test Cases ***
Get List and Check Page and Page Size
    Create Session              my_session    ${urlHost}     verify=true
    ${headers}=                 Create Dictionary      Content-Type=application/json    charset=utf-8
    ${response}=                Get On Session    my_session      ${enpoint}        headers=${headers}       
    Should Be Equal As Strings        ${response.status_code}       200
    ${jsondata}=                Convert String to JSON         ${response.content}
    ${numberOfPage}=            Set Variable        ${jsondata}[data][page]
    Should Be Equal As Strings             ${numberOfPage}             1
    ${numberOfPageSize}=        Set Variable         ${jsondata}[data][pageSize]
    Should Be Equal As Strings            ${numberOfPageSize}         10
    ${numberOfPageSize}=        Set Variable         ${jsondata}[data][pageSize]
    Should Be Equal As Strings            ${numberOfPageSize}         10
