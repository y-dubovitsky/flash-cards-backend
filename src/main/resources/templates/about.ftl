<#import "parts/index.ftl" as index>
<#import "parts/navbar.ftl" as navbar>

<@index.page "About" "/static/css/style.css" "">
    <#include "parts/sidebar.ftl">
    <div id="content" class="p-4 p-md-5">
        <div id="navbar">
            <@navbar.navbar>
            </@navbar.navbar>
        </div>
    </div>
</@index.page>