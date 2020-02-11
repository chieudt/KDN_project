*** Settings ***
Test Template
Library           RequestsLibrary
Library           JSONLibrary
Library           BuiltIn

*** Test Cases ***    NAME          EXXPECT
sosanh                [Template]    firstName
                      ahihi         OK

*** keywords ***
firstName
    create session    session    http://18.162.210.233:8080
    ${resp}=    get request    session    /api/v1/products?sort_sold_count=true
    Should Be Equal As Strings    ${resp.status_code}    200
    ${json}=    Set Variable    ${resp.json()}
    set global variable    ${json}
    log    ${json}
    log    nhập vào tên sp và sô sánh với sản phẩm đầu tiên trong chuỗi json:
    ${name}=    get value from json    ${json}    $.data.data[0].name
    Run Keyword If    '${expect}' == 'OK'    Assert success text
    ...    ELSE    Assert failure text    ${expect}
    ${priceCompare}=    getResquest    ${uri}
    ${price1}=    set variable    3000
    ${product1}=    get value from json    ${json}    $.data.data[0].price
    ${p}=    Get From List    ${product1}    0    # product1[0]
    ${pro1}=    Convert To String    ${p}
    Should Be Equal As Strings    ${pro1}    ${price1}
