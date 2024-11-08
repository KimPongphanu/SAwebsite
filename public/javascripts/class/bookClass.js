class bookClass{

    constructor(){
        this.books = [];
    }

    fetchBook() {
        return fetch('/Book/apiBook')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                if(data && data.item){
                    this.books = data.item;
                    
                }else{
                    this.books = [];
                }
                return this.books;
            })
            .catch(error =>{
                console.error("Error",error);
                this.books = [];
            })
    }


    async getBookCount(){
        await this.fetchBook();
        if(this.books.length > 0){
            return this.books.length;
        }else{
            return 0;
        }
    }

    async getBookID(){
        await this.fetchBook();
        if(this.books.length > 0){
            console.log("getLogID Successful");
            return this.books.map(book => book.id);
        }else{
            return [];
        }
    }

    async getBookUserID(){
        await this.fetchBook();
        if(this.books.length > 0){
            console.log("getLogfunction successful");
            return this.books.map(book => book.user_id);
        }else{
            return [];
        }
    }

    async getBookRoomNo(){
        await this.fetchBook();
        if(this.books.length > 0){
            console.log("getLogDatetime Successful");
            return this.books.map(book => book.room_no);
        }else{
            return [];
        }
    }

    async getBookRoomType(){
        await this.fetchBook();
        if(this.books.length > 0){
            console.log("getLogID Successful");
            return this.books.map(book => book.room_type);
        }else{
            return [];
        }
    }

    async getBookDate(){
        await this.fetchBook();
        if(this.books.length > 0){
            console.log("getLogID Successful");
            return this.books.map(book => book.date);
        }else{
            return [];
        }
    }

    async getBookTime(){
        await this.fetchBook();
        if(this.books.length > 0){
            console.log("getLogID Successful");
            return this.books.map(book => book.time);
        }else{
            return [];
        }
    }

    async getBookCrateAt(){
        await this.fetchBook();
        if(this.books.length > 0){
            console.log("getLogID Successful");
            return this.books.map(book => book.created_at);
        }else{
            return [];
        }
    }
}   

export default bookClass;