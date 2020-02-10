*** Settings ***
Resource          ../../Keywords/KM/api/sortProduct.robot

*** Test Cases ***    URI
minPrice              [Template]                               minPrice
                      /api/v1/products?sort_price=1

maxPrice              [Template]                               maxPrice
                      api/v1/products?sort_price=0

newProduct            [Template]                               newProduct
                      /api/v1/products?sort_new=true

bestSaleProduct       [Template]                               bestSaleProduct
                      /api/v1/products?sort_sold_count=true

listingProduct        [Template]                               listingProduct
                      /api/v1/products?page_size=10
