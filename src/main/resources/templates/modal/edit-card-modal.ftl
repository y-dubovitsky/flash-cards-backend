<#macro editCard card>
    <a class="nav-link fa fa-pencil-square-o"
       tabindex="-1" aria-disabled="true"
       data-toggle="modal" data-target="#editCardModal${card.id}">
    </a>
    <!-- Modal -->
    <div class="modal fade" id="editCardModal${card.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true" xmlns="http://www.w3.org/1999/html">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Edit card: ${card.id}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form
                        <#--                        TODO Важно решить проблему передачи аргумента в функцию вместо 1 100 -> 1100-->
                        action="javascript:editCardRequest(${card.id});"
                        enctype="multipart/form-data"
                        id="editCardForm${card.id}"
                        method="post"
                >
                    <div class="modal-body">
                        <#--                        <div class="form-group row">-->
                        <#--                            <label for="imgFile" class="col-sm-2 col-form-label">Image File: </label>-->
                        <#--                            <div class="col-sm-10">-->
                        <#--                                <input type="file" name="imageName" readonly class="form-control-plaintext"-->
                        <#--                                       id="imgFile">-->
                        <#--                            </div>-->
                        <#--                        </div>-->
                        <div class="form-group row">
                            <label for="inputFrontSideText${card.id}" class="col-sm-2 col-form-label">Front
                                Side: </label>
                            <div class="col-sm-10">
                                <input type="text" name="front" class="form-control" id="inputFrontSideText${card.id}"
                                       placeholder="${card.front}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputBackSideText${card.id}" class="col-sm-2 col-form-label">Back Side: </label>
                            <div class="col-sm-10">
                                <input type="text" name="back" class="form-control" id="inputBackSideText${card.id}"
                                       placeholder="${card.back}">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Create</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</#macro>