$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    function displayWeapon(bool) {
        if (bool) {
            $("#weaponlicense").show();
        } else {
            $("#weaponlicense").hide();
        }
    }

    display(false)
    displayWeapon(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "uiWeapon") {
            if (item.status == true) {
                displayWeapon(true)
            } else {
                displayWeapon(false)
            }
        }
    })
    
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ped-identification-card") {
            document.getElementById("personName").innerHTML = item.personName;
            document.getElementById("personSignature").innerHTML = item.personName;
        }
    })

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "weapon-identification-card") {
            document.getElementById("weaponowner").innerHTML = item.personName;
            document.getElementById("weaponsig").innerHTML = item.personName;
        }
    })
})