const headerTemplate = document.createElement('template');
headerTemplate.innerHTML = `   

<style>
@font-face {
    font-family: "Roboto", sans-serif;
    src: url("fonts/roboto/Roboto-Regular.ttf");
}

@font-face {
    font-family: "Pacifico";
    src: url("fonts/Pacifico-Regular.ttf");
}

body {
    margin: 0;
    padding: 0;
}

header {
    background-color: #fff;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    height: 30px;
    padding: 20px;
    z-index: 100;
}

.logo p {
    font-family: 'Pacifico';
    margin: 0;
    font-size: 34px;
}

nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    text-align: right;
}

nav li {
    display: inline-block;
    margin-left: 20px;
}

a {
    text-decoration: none;
}

nav a {
    font-family: 'Roboto';
    color: #000;
    text-decoration: none;
    font-size: 18px;
}
</style>

<header>
<div class="logo">
    <a href="https://www.stoobit.com">
        <p style="color: #2196f3;">stoobit</p< /a>
</div>
<nav>
    <ul>
        <li><a href="https://blog.stoobit.com">Blog</a></li>
    </ul>
</nav>
</header>
`

class Header extends HTMLElement {
    constructor() {
        // Always call super first in constructor
        super();
    }

    connectedCallback() {
        const shadowRoot = this.attachShadow({ mode: 'open' });
        shadowRoot.appendChild(headerTemplate.content);
    }
}

customElements.define('header-component', Header);
