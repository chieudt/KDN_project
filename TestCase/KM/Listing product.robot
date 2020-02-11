*** Settings ***
Resource          ../../Keywords/KM/api/sortProduct.robot

*** Test Cases ***    price 1
minPrice              [Template]                       minPrice
                      6000

maxPrice              [Template]                       maxPrice
                      20000

newProduct            [Template]                       newProduct
                      15

bestSaleProduct       [Template]                       bestSaleProduct
                      5

listingProduct        [Template]                       listingProduct
                      /api/v1/products?page_size=10
