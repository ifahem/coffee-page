<!DOCTYPE html>
<html lang="ar">
<head>
  <meta charset="UTF-8">
  <title>قهوتك المضحكة ☕</title>
  <style>
    body {
      direction: rtl;
      font-family: sans-serif;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      background: #fefefe;
      overflow: hidden;
    }
    #coffee {
      width: 100px;
      cursor: grab;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      transition: transform 0.3s ease;
    }
    #message {
      display: none;
      font-size: 24px;
      background: #ffefc1;
      padding: 20px;
      border-radius: 12px;
      margin-top: 30px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body>

  <img id="coffee" src="https://cdn-icons-png.flaticon.com/512/924/924514.png" draggable="true" alt="قهوة">
  <div id="message"></div>

  <script>
    const coffee = document.getElementById("coffee");
    const message = document.getElementById("message");
    let offsetX, offsetY;

    coffee.addEventListener("dragstart", (e) => {
      offsetX = e.offsetX;
      offsetY = e.offsetY;
    });

    document.body.addEventListener("dragover", (e) => {
      e.preventDefault();
    });

    document.body.addEventListener("drop", (e) => {
      e.preventDefault();
      coffee.style.left = `${e.clientX - offsetX}px`;
      coffee.style.top = `${e.clientY - offsetY}px`;
      showMessage();
    });

    function getMessageFromURL() {
      const params = new URLSearchParams(window.location.search);
      return params.get("msg") || "قهوتك جاهزة... بس بدون سكر يا حلو 😜";
    }

    function showMessage() {
      message.textContent = getMessageFromURL();
      message.style.display = "block";
    }
  </script>

</body>
</html>
