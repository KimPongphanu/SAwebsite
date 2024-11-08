class reportClass{

    constructor(){
        this.logs = [];
    }

    fetchReport() {
        return fetch('/dashboard/apiReport')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                if(data && data.item){
                    this.logs = data.item;
                    
                }else{
                    this.logs = [];
                }
                return this.logs;
            })
            .catch(error =>{
                console.error("Error",error);
                this.logs = [];
            })
    }

    async getReportLoginCount(){
        let arr = [];
        await this.fetchReport();
        if(this.logs.length > 0){
            console.log("getReportLoginCount Successful");
            for(let i=0;i<this.logs.length;i++){
                if(this.logs[i].type === "login"){
                    arr.push(this.logs[i]);
                }
            }
            return arr.length;
        }else{
            return 0;
        }
    }

    async getReportCount(){
        await this.fetchReport();
        if(this.logs.length > 0){
            return this.logs.length;
        }else{
            return 0;
        }
    }

    async getReportID(){
        await this.fetchReport();
        if(this.logs.length > 0){
            console.log("getLogID Successful");
            return this.logs.map(log => log.id);
        }else{
            return [];
        }
    }

    async getReportfunction(){
        await this.fetchReport();
        if(this.logs.length > 0){
            console.log("getLogfunction successful");
            return this.logs.map(log => log.function);
        }else{
            return [];
        }
    }

    async getReportDatetime(){
        await this.fetchReport();
        if(this.logs.length > 0){
            console.log("getLogDatetime Successful");
            return this.logs.map(log => log.datetime);
        }else{
            return [];
        }
    }

    async getReportUserID(){
        await this.fetchReport();
        if(this.logs.length > 0){
            console.log("getLogID Successful");
            return this.logs.map(log => log.user_id);
        }else{
            return [];
        }
    }
}   

export default reportClass;