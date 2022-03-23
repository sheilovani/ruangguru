*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         JSONLibrary

*** Variables ***
${urlHost}                   https://skillacademy.com/
${enpoint}                   skillacademy/discovery/search

*** Test Cases ***
Get List and Check Page and Page Size
    Create Session              my_session             ${urlHost}     verify=true
    ${headers}=                 Create Dictionary      Content-Type=application/json    charset=utf-8
    ${response}=                Get On Session         my_session      ${enpoint}        headers=${headers}       
    Should Be Equal As Strings            ${response.status_code}       200
    ${jsondata}=                Convert String to JSON         ${response.content}
    ${numberOfPage}=            Set Variable         ${jsondata}[data][page]
    Should Be Equal As Strings            ${numberOfPage}            1
    ${numberOfPageSize}=        Set Variable         ${jsondata}[data][pageSize]
    Should Be Equal As Strings            ${numberOfPageSize}         10
    ${numberOfTotalCourse}=     Set Variable         ${jsondata}[data][totalCourse]
    Should Be Equal As Strings            ${numberOfTotalCourse}      519


Get List by Search a Keyword
    Create Session              my_session              ${urlHost}     verify=true
    ${param}=                   Create Dictionary       searchQuery=marketing
    ${headers}=                 Create Dictionary       Content-Type=application/json    charset=utf-8
    ${response}=                Get On Session          my_session      ${enpoint}        headers=${headers}      params=${param}     
    Should Be Equal As Strings            ${response.status_code}       200
    ${jsondata}=                Convert String to JSON         ${response.content}
    ${numberOfPage}=            Set Variable         ${jsondata}[data][page]
    Should Be Equal As Strings            ${numberOfPage}             1
    ${numberOfPageSize}=        Set Variable         ${jsondata}[data][pageSize]
    Should Be Equal As Strings            ${numberOfPageSize}         10
    ${numberOfTotalCourse}=     Set Variable         ${jsondata}[data][totalCourse]
    Should Be True                        ${numberOfTotalCourse}>10

Get List by Minimum Price
    Create Session              my_session              ${urlHost}     verify=true
    ${param}=                   Create Dictionary       minPrice=300000
    ${headers}=                 Create Dictionary       Content-Type=application/json    charset=utf-8
    ${response}=                Get On Session          my_session      ${enpoint}        headers=${headers}      params=${param}     
    Should Be Equal As Strings            ${response.status_code}       200
    ${jsondata}=                Convert String to JSON         ${response.content}
    ${numberOfPage}=            Set Variable         ${jsondata}[data][page]
    Should Be Equal As Strings            ${numberOfPage}             1
    ${numberOfPageSize}=        Set Variable         ${jsondata}[data][pageSize]
    Should Be Equal As Strings            ${numberOfPageSize}         10
    ${numberOfTotalCourse}=     Set Variable         ${jsondata}[data][totalCourse]
    Should Be True                        ${numberOfTotalCourse}      220

Get List by Maxiumum Price
    Create Session              my_session              ${urlHost}     verify=true
    ${param}=                   Create Dictionary       maxPrice=300000
    ${headers}=                 Create Dictionary       Content-Type=application/json    charset=utf-8
    ${response}=                Get On Session          my_session      ${enpoint}        headers=${headers}      params=${param}     
    Should Be Equal As Strings            ${response.status_code}       200
    ${jsondata}=                Convert String to JSON         ${response.content}
    ${numberOfPage}=            Set Variable         ${jsondata}[data][page]
    Should Be Equal As Strings            ${numberOfPage}             1
    ${numberOfPageSize}=        Set Variable         ${jsondata}[data][pageSize]
    Should Be Equal As Strings            ${numberOfPageSize}         10
    ${numberOfTotalCourse}=     Set Variable         ${jsondata}[data][totalCourse]
    Should Be True                        ${numberOfTotalCourse}      341