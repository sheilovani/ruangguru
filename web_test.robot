*** Settings ***
Library                         SeleniumLibrary
Test Teardown                   Close Browser

*** Variables ***
${browser}                      Chrome
${linkURL}                      https://skillacademy.com/
${searchField}                  //*[@data-testid='search-input-field']
${searchResult}                 //*[@data-testid='total-result']
${courseCard}                   (//*[@data-testid='course-card'])[1]

*** Keywords ***
Open Skill Academy website
    Open Browser                            ${linkURL}          ${browser} 
    Maximize Browser Window

I Want to Search Management Skill
    Wait Until Page Contains Element        ${searchField}
    Click Element                           ${searchField}
    Input Text                              ${searchField}                    management
    Sleep                                   1
    Press Keys                              ${searchField}                    ENTER

I Will See Some of Courses List About Management as Search Result
    Sleep                                   2
    Wait Until Page Contains Element        ${searchResult}
    Wait Until Page Contains Element        ${courseCard}

*** Test Cases ***
As a Guest, I Want to Search a Skill in Skill Academy website
    Given Open Skill Academy website
    When I Want to Search Management Skill
    Then I Will See Some of Courses List About Management as Search Result