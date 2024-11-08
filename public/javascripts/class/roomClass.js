class roomClass {

    constructor(){
        this.rooms = [];
    }

    fetchData() {
        const ID = "/dashboard/api";
        return fetch(ID)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                //console.log("FetchData Successful");
                this.rooms = data.rooms;
                return this.rooms; 
            })
            .catch(error => {
                console.error("Fetch error", error);
            });
    }

    async getRoomID(){
        // if (this.rooms.length === 0) {
        //     await this.fetchData();
        // }
        await this.fetchData();
        if(this.rooms.length > 0){
            console.log("Get RoomID Successful");
            return this.rooms.map(room => room.id);
        }else{
            return [];
        }
    }

    async getRoomNo() {
        // if (this.rooms.length === 0) {
        //     await this.fetchData();
        // }
        await this.fetchData();
        if (this.rooms.length > 0) {
            console.log("Get RoomNO Successful");
            return this.rooms.map(room => room.roomno); 
        } else {
            return []; 
        }
    }

    async getRoomStatus(){
        // if (this.rooms.length === 0) {
        //     await this.fetchData();
        // }
        await this.fetchData();
        if(this.rooms.length > 0){
            console.log("Get RoomStatus Successful");
            return this.rooms.map(room => room.status);
        }else{
            return [];
        }
    }

    async getRoomType(){
        // if (this.rooms.length === 0) {
        //     await this.fetchData();
        // }
        await this.fetchData();
        if(this.rooms.length > 0){
            console.log("Get RoomType Successful");
            return this.rooms.map(room => room.type);
        }else{
            return [];
        }
    }

    async getRoomCount(){
        await this.fetchData();
        if(this.rooms.length > 0){
            console.log("getRoomCount Successful");
            return this.rooms.length;
        }
    }
    

    
}

export default roomClass;
