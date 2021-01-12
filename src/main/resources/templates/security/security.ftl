<#assign
    context = Session.SPRING_SECURITY_CONTEXT??
>

<#if context>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getUsername()
<#--        nameFirstLetter = String.valueOf(name.charAt(0)).toUpperCase()-->
<#--        isAdmin = user.isAdmin()-->
<#--        currentUserId = user.getId()-->
    >
<#else>
    <#assign
        name = "guest"
<#--        isAdmin = false-->
<#--        currentUserId = -1-->
    >
</#if>