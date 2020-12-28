<!-- Button trigger modal -->
<button type="button" class="btn btn-primary fa fa-plus ml-2" data-toggle="modal"
        data-target="#addCardModal">
</button>

<div class="modal fade" id="addCardModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Create new card</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form
                    action="javascript:addCardTextInputRequest(
                                            $('input[name=front]').val(),
                                            $('input[name=back]').val()
                                    );"
                    method="post"
                    enctype="multipart/form-data"
            >
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="textFile" class="col-sm-2 col-form-label">Text File: </label>
                        <div class="col-sm-10">
                            <input type="file" name="file" readonly class="form-control-plaintext" id="textFile">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="imgFile" class="col-sm-2 col-form-label">Image File: </label>
                        <div class="col-sm-10">
                            <input type="file" name="imageName" readonly class="form-control-plaintext" id="imgFile">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputFrontSideText" class="col-sm-2 col-form-label">Front Side: </label>
                        <div class="col-sm-10">
                            <input type="text" name="front" class="form-control" id="inputFrontSideText" placeholder="front page text...">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputBackSideText" class="col-sm-2 col-form-label">Back Side: </label>
                        <div class="col-sm-10">
                            <input type="text" name="back" class="form-control" id="inputBackSideText" placeholder="back page text...">
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
