<#if cards?has_content>
    <#list cards as card>
        <div class="card text-center mt-2 mb-2">
            <div class="card-header">
                <ul class="nav nav-pills card-header-pills">
                    <li class="nav-item">
                        <a class="nav-link fa fa-check-square-o" href="#"></a>
                    </li>
                    <li class="nav-item">
                        <a onclick="console.log('Wow, wow...')" class="nav-link fa fa-pencil-square-o"
                           href="#"
                           tabindex="-1" aria-disabled="true"></a>
                    </li>
                    <li class="nav-item">
                        <a onclick="aliveFunc()" class="nav-link fa fa-question-circle" href="#"
                           tabindex="-1"
                           aria-disabled="true"></a>
                    </li>
                    <li class="nav-item">
                        <a onclick="deleteCardRequest(${card.id})" class="nav-link fa fa-trash-o" tabindex="-1"
                           aria-disabled="true"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fa fa-star" aria-hidden="true" href="#" tabindex="-1"
                           aria-disabled="true"></a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <h2 class="card-title m-5">${card.front}</h2>
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
                <button type="button" class="btn btn-success">Know</button>
                <button type="button" class="btn btn-danger">Unknown</button>
            </div>
        </div>
    </#list>
<#------------------------------------------ Pagination ------------------------------------------>

    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>

<#------------------------------------------ Pagination ------------------------------------------>
<#else>
    <p>Ooops, there is no flash cards</p>
</#if>