% for user in usersData:
    <div class="container">    
        <section class="threeColumns first">
            <a href="/profile/{{user['name']}}/">{{user['name']}} </a>
            <span class="label">Name</span>
        </section>
        <section class="threeColumns">
            {{user['gender']}} 
            <span class="label">Gender</span>
        </section>
        <section class="threeColumns last">
            {{user['age']}} 
            <span class="label">Age</span>
        </section>
    </div>
% end