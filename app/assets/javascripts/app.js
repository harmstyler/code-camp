window.onload = (function() {
    return function() {
        sdcc.menuInit();
    }
})();

var sdcc = {
    openedHeight: '',
    menuOpen: true,
    mainMenu: null,
    menuInit: function() {
        this.mainMenu = document.getElementById('mainNav');
        this.closeMenu();
    },
    closeMenu: function() {
        var height = this.mainMenu.clientHeight;
        this.openedHeight = height + 'px';

        this.mainMenu.style.height = '0';
        this.menuOpen = false;

        var menuLinks = document.getElementById('mainNav').children.length;
        var compHeight = 40 + (51 * menuLinks)

        if (height < compHeight) {
            this.openedHeight = compHeight + 'px';
        }
        console.log(compHeight);
    },
    toggleMenu: function() {
        var body = document.getElementsByTagName('body')[0];

        if(this.menuOpen) {
            this.closeMenu();
            body.removeAClass('menu-open');
        } else {
            body.className += 'menu-open';
            this.mainMenu.style.height = this.openedHeight;
            this.menuOpen = true;
        }
    }
};

HTMLElement.prototype.removeAClass = function(classToRemove) {
    var newClassName = "";
    var i;
    var classes = this.className.split(" ");
    for(i = 0; i < classes.length; i++) {
        if(classes[i] !== classToRemove) {
            newClassName += classes[i] + " ";
        }
    }
    this.className = newClassName;
}
