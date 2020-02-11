*** variables ***
${url}            http://18.162.210.233:8080

*** Keywords ***
global env
    set global variable    ${url}
    #set global variable    ${total}=    get value from json    ${json}    $.data.total
