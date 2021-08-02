<header>
    <div class="px-3 py-2 bg-dark text-white navbar-expand-lg">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="MainController?search=&action=SearchBook" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                    <svg class="bi bi-book-2" width="40" height="32" ><use xlink:href="#book"/></svg>
                </a>

                <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small ">

                    <li>
                        <a href="MainController?action=ViewOrder" class="nav-link text-white ">
                            <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#table"/></svg>
                            Orders
                        </a>
                    </li>
                    <li>
                        <a href="MainController?action=ViewCart" class="nav-link text-white">
                            <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#cart"/></svg>
                            Cart
                        </a>
                    </li>
                    <li>
                        <a href="MainController?action=ViewProfile" class="nav-link text-white">
                            <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#people-circle"/></svg>
                            Profile
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="px-3 py-2 border-bottom mb-3">
        <div class="container d-flex flex-wrap justify-content-center">
            <div class="input-group">
                <form class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto" action="MainController">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search..." aria-label="Search" name="search" value="${param.search}">
                        <button type="submit" class="btn btn-primary" name="action" value="SearchBook">Search</button>
                    </div>
                </form>


                <div class="text-end">
                    <a href="MainController?action=Logout">
                        <button type="submit" class="btn btn-secondary text-white me-2">Log Out</button>
                    </a>
                </div>
            </div>
        </div>
    </div>

</header>