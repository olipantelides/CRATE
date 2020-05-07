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
            % include('components/userProfile')

            <section>
                <h3><a href="/api/getUsers/">View As API</a></h3>
            </section>
            <div class="container">
                <h4 class="label" style="text-align: right; width: 100%;"><a href="https://github.com/olipantelides/crate">Made with CRATE</a></b></h4>
            </div>
        
        % end
        
        <!-- USER PROFILE INTERFACE -->

        % if currentPage == 'profile':
            <section>
                <h1 class="logo">Welcome to {{usersData[0]['name']}}'s profile</h1>
            </section>
            % include('components/userProfile')

            <section>
                <h3><a href="/api/getUser/{{usersData[0]['name']}}/">View As API</a></h3>
            </section>
            <section>
                <h3><a href="/">return home</a></h3>
            </section>
            <div class="container">
                <h4 class="label" style="text-align: right; width: 100%;"><a href="https://github.com/olipantelides/crate">Made with CRATE</a></b></h4>
            </div>
        % end
        
    </body>
</html>