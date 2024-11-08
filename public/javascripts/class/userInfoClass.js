class userInfoClass{

    constructor(){
        this.users = [];
    }

    fetchUsers(){
        return fetch('/dashboard/apiusers')
        .then(response => {
            if (!response.ok) {
                throw new Error("Network response was not OK" + response.statusText);
            }
            return response.json();
        })
        .then(data => {
            //console.log(data);
            if(data && data.item){
                this.users = data.item;
            }else{
                this.users = [];
            }
            return this.users;
            
        })
        .catch(error => {
            console.error("Fetch Users Error", error);
            this.users = [];
        }); 
    }

    async getUserID(){
        if (this.users.length === 0) {
            await this.fetchUsers();
        }
        if(this.users.length > 0){
            console.log("getUserID Successful");
            return this.users.map(user => user.user_id);
        }else{
            return [];
        }
    }

    async getUserFirstName(){
        if (this.users.length === 0) {
            await this.fetchUsers();
        }
        if(this.users.length > 0){
            console.log("getUserFirstName Successful");
            return this.users.map(user => user.first_name);
        }else{
            return [];
        }
    }

    async getUserLastName(){
        if (this.users.length === 0) {
            await this.fetchUsers();
        }
        if(this.users.length > 0){
            console.log("getUserLastName successful");
            return this.users.map(user => user.last_name);
        }else{
            return [];
        }
    }

    async getUserEmail(){
        if (this.users.length === 0) {
            await this.fetchUsers();
        }
        if(this.users.length > 0){
            console.log("getUserEmail Successful");
            return this.users.map(user => user.email);
        }else{
            return [];
        }
    }

    async getUserPhone(){
        if (this.users.length === 0) {
            await this.fetchUsers();
        }
        if(this.users.length > 0){
            console.log("getUserPhone Successful");
            return this.users.map(user => user.phone);
        }else{
            return [];
        }
    }

    async getUserCount(){
        await this.fetchUsers();
        if(this.users.length > 0){
            console.log("getUserCount Successful");
            return this.users.length;
        }else{
            return 0;
        }
    }

}

export default userInfoClass;