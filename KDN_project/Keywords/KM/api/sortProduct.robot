*** setting ***
Library           JSONLibrary
Resource          ../env/env.robot
Library           RequestsLibrary

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

minPrice
    [Arguments]    ${uri}
    getResquest    ${uri}
    log    sản phẩm sắp xếp theo thứ tự tăng dần:
    ${product1}=    get value from json    ${json}    $.data.data[0].price
    ${product2}=    Get Value From Json    ${json}    $.data.data[1].price
    ${product3}=    Get Value From Json    ${json}    $.data.data[2].price
    ${product4}=    Get Value From Json    ${json}    $.data.data[3].price
    ${product5}=    Get Value From Json    ${json}    $.data.data[4].price

maxPrice
    [Arguments]    ${uri}
    getResquest    ${uri}
    log    tổng số sản phẩm là:
    ${total}=    get value from json    ${json}    $.data.total
    log    sản phẩm sắp xếp theo thứ tự GIẢM dần:
    ${product1}=    get value from json    ${json}    $.data.data[0].price
    ${product2}=    Get Value From Json    ${json}    $.data.data[1].price
    ${product3}=    Get Value From Json    ${json}    $.data.data[2].price
    ${product4}=    Get Value From Json    ${json}    $.data.data[3].price
    ${product5}=    Get Value From Json    ${json}    $.data.data[4].price

newProduct
    [Arguments]    ${uri}
    getResquest    ${uri}
    log    tổng số sản phẩm là:
    ${total}=    get value from json    ${json}    $.data.total
    log    sản phẩm sắp xếp theo Hàng MỚI NHẤT:
    ${product1}=    get value from json    ${json}    $.data.data[0].id
    ${product2}=    Get Value From Json    ${json}    $.data.data[1].id
    ${product3}=    Get Value From Json    ${json}    $.data.data[2].id
    ${product4}=    Get Value From Json    ${json}    $.data.data[3].id
    ${product5}=    Get Value From Json    ${json}    $.data.data[4].id

bestSaleProduct
    [Arguments]    ${uri}
    getResquest    ${uri}
    log    tổng số sản phẩm là:
    ${total}=    get value from json    ${json}    $.data.total
    log    sản phẩm sắp xếp theo Hàng BÁN CHẠY NHẤT:
    ${product1}=    get value from json    ${json}    $.data.data[0].sold_count
    ${product2}=    Get Value From Json    ${json}    $.data.data[1].sold_count
    ${product3}=    Get Value From Json    ${json}    $.data.data[2].sold_count
    ${product4}=    Get Value From Json    ${json}    $.data.data[3].sold_count
    ${product5}=    Get Value From Json    ${json}    $.data.data[4].sold_count

listingProduct
    [Arguments]    ${uri}
    getResquest    ${uri}
    log    tổng số sản phẩm tren 1 page, hien thi 13 rows, 4sp/ row --> 52sp/page:
    ${pro_per_page}=    get value from json    ${json}    $.data.to
    log    số lượng paging
    ${total_page}=    get value from json    ${json}    $.data.last_page
