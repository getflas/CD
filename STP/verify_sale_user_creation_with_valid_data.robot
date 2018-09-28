*** Settings ***
Library           Selenium2Library    WITH NAME    se

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_sale_user_creation_with_valid_data
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    disable-extension
    Call Method    ${chrome_options}    add_argument    disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    no-sandbox
    ${options}=    Call Method    ${chrome_options}    to_capabilities
    Open Browser    http://111.93.7.182    Chrome    desired_capabilities=${options}
    Input Text    xpath=//input[@id='emailid']    veera@gm.com
    Input Password    xpath=//input[@id='pwd']    mypassword
    Click Button    xpath=//button[@class='btn btn-purple btn-block text-uppercase waves-effect waves-light']
    Maximize Browser Window
    Wait Until Page Contains Element    xpath://*[@id="wrapper"]/div[3]/div/div/div[1]/div/div/a    30
    Click Element    xpath://*[@id="wrapper"]/div[3]/div/div/div[1]/div/div/a
    Wait Until Element Is Visible    xpath://*[@id="firstname"]    30
    Input Text    xpath://*[@id="firstname"]    testing
    Wait Until Element Is Visible    id:lastname    30
    Input Text    id:lastname    fifteen
    Wait Until Element Is Visible    id:email    30
    Input Text    id:email    35testing35@gm.com
    Wait Until Element Is Visible    id:empno    30
    Input Text    id:empno    3535
    Wait Until Element Is Visible    id:roleId    30
    Click Element    id:roleId
    Wait Until Element Is Visible    xpath://*[@id="roleId"]/option[10]    30
    Click Element    xpath://*[@id="roleId"]/option[10]
    Wait Until Element Is Visible    id:reportingId    30
    Click Element    id:reportingId
    Wait Until Page Contains Element    xpath://*[@id="reportingId"]/option[12]    30
    Click Element    xpath://*[@id="reportingId"]/option[12]
    Wait Until Element Is Visible    id:location    30
    Input Text    id:location    hyderabad
    Wait Until Page Contains Element    id:createuser    30
    Click Element    id:createuser
    Wait Until Page Contains    User Created Succesfully    50
    Reload Page
    Wait Until Page Contains Element    xpath://*[@id="datatable-responsive_filter"]/label/input    50
    Input Text    xpath://*[@id="datatable-responsive_filter"]/label/input    35testing35@gm.com
    Wait Until Page Contains Element    xpath://*[@id="userstable"]/tr/td[8]/a[2]/i    50
    Click Element    xpath://*[@id="userstable"]/tr/td[8]/a[2]/i
    Sleep    2
    Wait Until Page Contains Element    xpath://*[@id="confirm"]    50
    Click Element    xpath://*[@id="confirm"]
    Wait Until Page Contains    User Deleted Successfully    50
    Close Browser