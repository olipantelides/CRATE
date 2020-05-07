<%
currentPath = request.path
currentPage = currentPath

if not currentPath == '/':
    currentPath = currentPath.lstrip('/').rstrip('/').split('/')
    currentPage = currentPath[0]

    if len(currentPage) > 0:
        currentArg1 = currentPath[1]
    end
end
%>
% include('components/header')
    <body>
        <!-- INDEX INTERFACE -->
        % if currentPage == '/':
            <section>
                <h1 class="logo">Welcome to CRATE</h1>
            </section>

             <!-- ADD YOUR COMPONENTS 
                "% include('components/example')"
            -->

            <section>
                <h2>{{myFunctionVariableName}}</h2>
                <h4><a href="https://github.com/olipantelides/crate">Made with CRATE</a></b></h4>
            </section>
        
        % end
    </body>
</html>