<#import "parts/index.ftl" as index>

<@index.page "FlashCard" "/static/css/style.css" "/static/js/card.js">
    <h1>Hello ${user.getUsername()}</h1>
        <#include "parts/sidebar.ftl">
        <div id="content" class="p-4 p-md-5">
            <div id="navbar">
                <#include "parts/navbar.ftl">
            </div>
            <div id="flash_cards">
                <#include "parts/flash-cards.ftl">
            </div>
        </div>
</@index.page>
