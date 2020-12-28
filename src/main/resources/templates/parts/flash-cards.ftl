<#import "../modal/edit-card-modal.ftl" as editCardModal>

<div>
    <#if errors??>
        <h1>Validation Error!</h1>
    </#if>
</div>

<#if cards?has_content>
    <#list cards as card>
        <div class="card text-center mt-2 mb-2">
            <div class="card-header">
                <ul class="nav nav-pills card-header-pills">
                    <li class="nav-item">
                        <a class="nav-link fa fa-check-square-o" href="#"></a>
                    </li>
                    <li class="nav-item">

                        <#--                        Edit Card Modal-->

                        <@editCardModal.editCard card></@editCardModal.editCard>

                        <#--                        Edit Card Modal-->

                    </li>
                    <li class="nav-item">
                        <a onclick="aliveFunc()" class="nav-link fa fa-question-circle"
                           tabindex="-1"
                           aria-disabled="true"></a>
                    </li>
                    <li class="nav-item">
                        <a onclick="deleteCardRequest(${card.id})"
                           class="nav-link fa fa-trash-o"
                           tabindex="-1"
                           aria-disabled="true"
                        >
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fa fa-star" aria-hidden="true" tabindex="-1"
                           aria-disabled="true"></a>
                    </li>
                </ul>
            </div>
            <div class="card-body">

                <#--                Card Side-->

                <h2 class="card-title m-5"
                    onclick="turnCard('back' + '${card.id}', this)"
                    data-placement="top"
                    data-toggle="tooltip"
                    id="front${card.id}"
                    title="Press me to flip the card">
                    ${card.front}
                </h2>

                <h2 id="back${card.id}"
                    onclick="turnCard('front' + '${card.id}', this)"
                    style="display: none"
                    class="card-title m-5">
                    ${card.back}
                </h2>

                <#--                Card Side-->

                <#--                Prompt-->

                <div class="collapse" id="collapseExample">
                    <div class="card card-body">
                        <#if card.prompt??>
                            <p class="card-text">${card.prompt}</p>
                        <#else>
                            <p class="card-text">Ooops, no prompt</p>
                        </#if>
                    </div>
                </div>

                <#--                Prompt-->

                <#--                Know Button-->

                <button type="button" class="btn btn-success">Know</button>
                <button type="button" class="btn btn-danger">Unknown</button>

                <#--                Know Button-->

            </div>
        </div>
    </#list>
<#------------------------------------------ Pagination ------------------------------------------>

    <#include "card-pagination.ftl">

<#------------------------------------------ Pagination ------------------------------------------>
<#else>
    <p>Ooops, there is no flash cards</p>
</#if>