*** setting ***
Library           JSONLibrary
Resource          ../env/env.robot
Library           RequestsLibrary
Library           BuiltIn
Library           Collections

*** variables ***

*** keywords ***
getResquest
    [Arguments]    ${uri}
    create session    session    ${url}
    ${resp}=    get request    session    ${uri}
    Should Be Equal As Strings    ${resp.status_code}    200
    ${json}=    Set Variable    ${resp.json()}
    set global variable    ${json}
    log    ${json}
    [Return]    ${json}

minPrice
    [Arguments]    ${price_variable}
    ${priceCompare}=    getResquest    /api/v1/products?sort_price=1
    log    so sánh giá trị thứ 1:
    ${price1}=    set variable    ${price_variable}
    ${product1}=    get value from json    ${json}    $.data.data[0].price
    ${p1}=    Get From List    ${product1}    0    # product1[0]
    ${pro1}=    Convert To String    ${p1}
    Should Be Equal As Strings    ${pro1}    ${price1}
    # log    so sánh giá trị thứ 2
    # ${price2}=    BuiltIn.Set Variable    ${price_variable2}
    #${product2}=    Get Value From Json    ${json}    $.data.data[1].price
    #${p2}=    Get From List    ${product2}    0
    # ${pro2}=    convert to string    ${p2}
    # should be equal as strings    ${pro2}    ${price2}

maxPrice
    [Arguments]    ${price_variable}
    ${priceCompare}=    getResquest    /api/v1/products?sort_price=0
    log    so sánh giá trị thứ 1:
    ${price1}=    set variable    ${price_variable}
    ${product1}=    get value from json    ${json}    $.data.data[0].id
    ${p1}=    Get From List    ${product1}    0    # product1[0]
    ${pro1}=    Convert To String    ${p1}
    Should Be Equal As Strings    ${pro1}    ${price1}
    # log    so sánh giá trị thứ 2
    #    ${price2}=    BuiltIn.Set Variable    ${price_variable2}
    #    ${product2}=    Get Value From Json    ${json}    $.data.data[1].price
    #    ${p2}=    Get From List    ${product2}    0
    # ${pro2}=    convert to string    ${p2}
    # should be equal as strings    ${pro2}    ${price2}

newProduct
    [Arguments]    ${variable}
    ${priceCompare}=    getResquest    /api/v1/products?sort_new=true
    log    so sánh giá trị thứ 1:
    ${new_product}=    set variable    ${variable}
    ${product1}=    get value from json    ${json}    $.data.data[0].id
    ${p1}=    Get From List    ${product1}    0    # product1[0]
    ${pro1}=    Convert To String    ${p1}
    Should Be Equal As Strings    ${pro1}    ${new_product}

bestSaleProduct
    [Arguments]    ${variable}
    ${priceCompare}=    getResquest    /api/v1/products?sort_sold_count=true
    log    so sánh giá trị thứ 1:
    ${best_sale}=    set variable    ${variable}
    ${product1}=    get value from json    ${json}    $.data.data[0].sold_count
    ${p1}=    Get From List    ${product1}    0    # product1[0]
    ${pro1}=    Convert To String    ${p1}
    Should Be Equal As Strings    ${pro1}    ${best_sale}

listingProduct
    [Arguments]    ${uri}
    getResquest    ${uri}
    log    tổng số sản phẩm tren 1 page, hien thi 13 rows, 4sp/ row --> 52sp/page:
    ${pro_per_page}=    get value from json    ${json}    $.data.to
    log    số lượng paging
    ${total_page}=    get value from json    ${json}    $.data.last_page
