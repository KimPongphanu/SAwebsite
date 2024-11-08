import roomClass from './class/roomClass.js'; 
import userInfoClass from './class/userInfoClass.js';


document.addEventListener("DOMContentLoaded", async () => {
    const room = new roomClass();
    const user = new userInfoClass();

    let userFirstName = await user.getUserFirstName();
    let userLastName = await user.getUserLastName();
    let userTel = await user.getUserTel();
    let telout = document.getElementById('userinfo');

    if(userFirstName.length > 0){
        telout.innerHTML = userFirstName[0]+" "+userLastName[0]+" "+userTel[0];
    }else{
        telout.innerHTML = "Empty userInfomation";
    }

    let roomID = await room.getRoomID();
    let outputElement = document.getElementById('out');
    if (roomID.length > 1) {
        outputElement.innerHTML = roomID[1];
    } else {
        outputElement.innerHTML = "No room ID available."; 
    }
});

