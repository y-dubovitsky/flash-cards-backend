<#import "parts/index.ftl" as index>

<@index.page "Task" "/static/css/style.css" "">
    <#include "parts/sidebar.ftl">
    <div id="content" class="p-4 p-md-5">

        <#include "parts/navbar.ftl">

        <form action="/task/add" method="post">
            <div class="form-group">
                <label for="taskText">Name</label>
                <input type="text" class="form-control" name="name" id="taskText" placeholder="Enter name of task">
            </div>
            <div class="form-group">
                <label for="taskDescription">Description</label>
                <input type="text" name="description" class="form-control" id="taskDescription" placeholder="Task description">
            </div>
            <div class="form-group">
                <label for="taskCategory">Category</label>
                <input type="text" class="form-control" id="taskCategory" placeholder="Password">
            </div>
            <div class="form-group">
                <label for="taskImage">Image</label>
                <input type="file" class="form-control-file" id="taskImage">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-primary">Create</button>
        </form>

        <#if tasks??>
            <#list tasks as task>
                <table class="table table-bordered mt-5">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Status</th>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">${task.id}</th>
                        <td>
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">${task.status?string("Done", "UnDone")}</label>
                            </div>
                        </td>
                        <td>${task.name}</td>
                        <td>${task.description}</td>
                    </tr>
                    </tbody>
                </table>
            </#list>
        <#else>
            There is no tasks for now!
        </#if>
    </div>
</@index.page>