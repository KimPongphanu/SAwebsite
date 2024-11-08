class imageRoomClass {
    constructor() {
        this.img = null; // เก็บข้อมูลภาพเดียว
    }

    // ฟังก์ชันที่ดึงข้อมูลภาพสำหรับประเภท A
    fetchReportA() {
        return fetch('/dashboard/apiImgA')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                if (data && data.item.length > 0) {
                    // ใช้ภาพแรกที่ได้
                    this.img = {
                        filename: data.item[0].filename,
                        filepath: data.item[0].filepath,
                        src: `/${data.item[0].filepath}` // สร้าง URL สำหรับภาพ
                    };
                } else {
                    this.img = null; // ไม่มีภาพ
                }
                return this.img; // ส่งกลับภาพ
            })
            .catch(error => {
                console.error("Error", error);
                this.img = null; // เก็บ null เมื่อเกิดข้อผิดพลาด
            });
    }

    fetchReportB() {
        return fetch('/dashboard/apiImgB')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                if (data && data.item.length > 0) {
                    // ใช้ภาพแรกที่ได้
                    this.img = {
                        filename: data.item[0].filename,
                        filepath: data.item[0].filepath,
                        src: `/${data.item[0].filepath}` // สร้าง URL สำหรับภาพ
                    };
                } else {
                    this.img = null; // ไม่มีภาพ
                }
                return this.img; // ส่งกลับภาพ
            })
            .catch(error => {
                console.error("Error", error);
                this.img = null; // เก็บ null เมื่อเกิดข้อผิดพลาด
            });
    }

    fetchReportC() {
        return fetch('/dashboard/apiImgC')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                if (data && data.item.length > 0) {
                    // ใช้ภาพแรกที่ได้
                    this.img = {
                        filename: data.item[0].filename,
                        filepath: data.item[0].filepath,
                        src: `/${data.item[0].filepath}` // สร้าง URL สำหรับภาพ
                    };
                } else {
                    this.img = null; // ไม่มีภาพ
                }
                return this.img; // ส่งกลับภาพ
            })
            .catch(error => {
                console.error("Error", error);
                this.img = null; // เก็บ null เมื่อเกิดข้อผิดพลาด
            });
    }

    // ฟังก์ชันที่ดึงภาพ A
    async getImgA() {
        await this.fetchReportA();
        return this.img; // ส่งกลับภาพ
    }

    async getImgB() {
        await this.fetchReportB();
        return this.img; // ส่งกลับภาพ
    }

    async getImgC() {
        await this.fetchReportC();
        return this.img; // ส่งกลับภาพ
    }
}

export default imageRoomClass;