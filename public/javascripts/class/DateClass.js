class dateClass {

    constructor(){}

    getCurrentLocalTime() {
        const now = new Date();
        const offset = now.getTimezoneOffset() * 60000;
        const localTime = new Date(now - offset).toISOString().slice(0, 19).replace('T', ' ');
        return localTime;
    }
 
}

export default dateClass;





