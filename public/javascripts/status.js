var currentFloor = 1; // ตั้งค่าชั้นเริ่มต้นเป็น 1

function getRooms(x, y) {
  console.log('Fetching rooms...');
  fetch('http://localhost:3000/status/api')
      .then(response => response.json())
      .then(data => {
          console.log('Data received:', data);
          let out = document.getElementById('output');
          if (out) {
              console.log('Clearing output...');
              out.innerHTML = ''; // Clear old data before displaying new data
              let floor_start = 0;
              let floor_end = 0;
              let image = ["/images/status/room1.jpg","/images/status/room2.jpg","/images/status/room3.jpg"];
             
              if (currentFloor >= 0){

                  switch(currentFloor){
                    case 1 : floor_start = 0;
                            floor_end = 5;
                            break;
                    case 2 : floor_start = 5;
                            floor_end = 10;
                            break;
                    case 3 : floor_start = 10;
                            floor_end = 15;
                            break;
                    case 4 : floor_start =15;
                            floor_end = 16;
                            break;
                    case 5 : floor_start = 0;
                            floor_end = 0;
                            break;
                    default : console.log("ระบบห้องปิดปรับปรุงชั่วคราว ขออภัยมา ณ ที่นี้ด้วย");
                  }                

                  for (let i = floor_start; i < floor_end; i++) {
                      let room = data.rooms[i];
                      let square = document.createElement('div');
                      square.className = 'square';
                      square.style.border = room.STATUS === 1 ? '10px solid red ' : '10px solid greenyellow';
                      square.textContent = `Room: ${room.roomno}`;
                      if(image[i]){
                        square.style.backgroundImage = `url(${image[i]})`;
                        square.style.backgroundSize = 'cover';
                      }
                      
                      out.appendChild(square);
                  }
              } else {
                  console.error('Index range is out of bounds');
              }

              console.log('Data displayed');
          }
      })
      .catch(error => console.error('Error:', error));
}

document.addEventListener('DOMContentLoaded', () => {
  console.log('DOMContentLoaded event fired');
  getRooms(); // เริ่มต้นด้วยการแสดงห้องจากชั้น 1
  getFloors(); // เรียกใช้งานฟังก์ชัน getFloors เพื่อสร้างปุ่ม
});

function getFloors() {
  let out = document.getElementById('circle-output');
  if (out) {
    out.innerHTML = '';

    for (let i = 1; i < 5; i++) {
      let circle = document.createElement('button');
      circle.className = 'circle';
      circle.textContent = i;

      // ตรวจสอบปุ่มที่เลือก
      if (i === currentFloor) {
        circle.classList.add('selected'); // เพิ่มคลาส selected ให้กับปุ่มที่เลือก
        circle.style.backgroundColor = 'red'; // เปลี่ยนสีพื้นหลังของปุ่มที่เลือก
      } else {
        circle.style.backgroundColor = 'green'; // สีพื้นฐานของปุ่มอื่นๆ
      }

      circle.addEventListener('click', () => {
        let x = (i - 1) * 5;
        let y = x + 5;
        getRooms(x, y);

        // เปลี่ยนสีของปุ่มที่เลือก
        let buttons = document.querySelectorAll('.circle');
        buttons.forEach(btn => {
          btn.classList.remove('selected'); // ลบคลาส selected จากปุ่มทั้งหมด
          btn.style.backgroundColor = 'green'; // เปลี่ยนสีพื้นฐาน
        });

        circle.classList.add('selected'); // เพิ่มคลาส selected ให้กับปุ่มที่เลือก
        circle.style.backgroundColor = 'red'; // เปลี่ยนสีพื้นหลังของปุ่มที่เลือก

        currentFloor = i; // อัปเดตชั้นที่เลือก
      });

      out.appendChild(circle);
    }
  }
}

//new
document.addEventListener('DOMContentLoaded', function() {
  const scrollButton = document.getElementById('scrollButton');
  const content = document.getElementById('content');

  // ฟังก์ชันสำหรับแสดงเนื้อหาด้วยการเลื่อน
  function showContent() {
    content.classList.add('show');
  }

  // ฟังก์ชันสำหรับซ่อนเนื้อหา
  function hideContent() {
    content.classList.remove('show');
  }

  // เมื่อคลิกปุ่ม "Scroll Right"
  scrollButton.addEventListener('click', showContent);

  // เมื่อคลิกที่ส่วนใดก็ได้บนหน้าเว็บ (นอกเหนือจากปุ่มและเนื้อหา)
  document.addEventListener('click', function(event) {
    if (!content.contains(event.target) && event.target !== scrollButton) {
      hideContent();
    }
  });
});

//time

function formatDateTime(date) {
  const daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

  const dayOfWeek = daysOfWeek[date.getDay()]; // วันของสัปดาห์
  const day = date.getDate(); // วันของเดือน
  const month = months[date.getMonth()]; // เดือน
  const year = date.getFullYear(); // ปี

  const hours = date.getHours().toString().padStart(2, '0');
  const minutes = date.getMinutes().toString().padStart(2, '0');
  const seconds = date.getSeconds().toString().padStart(2, '0');

  return `${dayOfWeek} ${day}/${date.getMonth() + 1}/${year} ${hours}:${minutes}:${seconds}`;
}

function updateTime() {
  const now = new Date(); // สร้างออบเจ็กต์ Date ใหม่สำหรับเวลาปัจจุบัน
  const formattedTime = formatDateTime(now);
  document.getElementById('time').textContent = formattedTime;
}

// เรียกใช้ updateTime ทันทีเมื่อโหลดหน้าเว็บ
document.addEventListener('DOMContentLoaded', function() {
  updateTime(); // แสดงวันที่และเวลาในรูปแบบที่ต้องการ
  setInterval(updateTime, 1000); // อัพเดทวันที่และเวลาในทุก 1 วินาที
});



