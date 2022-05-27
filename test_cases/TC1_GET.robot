*** Settings ***
Library    RequestsLibrary


*** Variables ***
${base_URL}         https://robotframework.org
${usr_guide_URL}    /robotframework/#user-guide
${strt_lib}         /robotframework/#standard-libraries
${doc_api}          https://robot-framework.readthedocs.io/en/stable/


*** Test Cases ***
# Checking homepage
GET_home_page_robotframework
    create session    mysession    ${base_URL}
    ${response}=    get on session    mysession    ${base_URL}
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}    200

# Checking docs/user guide
GET_user_guide
    ${response}=    get on session    mysession    ${base_URL}${usr_guide_URL}
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}    200

    ${body}=    convert to string    ${response.content}
    should contain    ${body}    Robot Framework documentation
    should contain    ${body}    User Guide

# Checking docs/standard libraries
GET_standard_libraries
    ${response}=    get on session    mysession    ${base_URL}${strt_lib}
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}    200

    ${body}=    convert to string    ${response.content}
    should contain    ${body}    Robot Framework documentation
    should contain    ${body}    Standard libraries

# Checking docs/public api
GET_public_api
    ${response}=    get on session    mysession    ${doc_api}
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}    200

    ${body}=    convert to string    ${response.content}
    should contain    ${body}    Robot Framework API documentation
    should contain    ${body}    Public API

