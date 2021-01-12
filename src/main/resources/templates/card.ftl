<#import "parts/index.ftl" as index>
<#import "parts/navbar.ftl" as navbar>

<@index.page "FlashCard" "/static/css/style.css" "/static/js/card.js">
    <#include "parts/sidebar.ftl">
    <div id="content" class="p-4 p-md-5">
        <div id="navbar">
            <@navbar.navbar>
                <#include "modal/add-card-modal.ftl">
            </@navbar.navbar>
        </div>
        <div id="flash_cards">
            <#include "parts/flash-cards.ftl">
        </div>
    </div>
</@index.page>
