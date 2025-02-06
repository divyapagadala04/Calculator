<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background: linear-gradient(to right, #ff9966, #ff5e62);
            color: white;
        }
        .calculator {
            width: 400px;
            margin: 90px auto;
            padding: 20px;
            background: #222;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.5);
        }
        .screen {
            width: 90%;
            padding: 10px;
            font-size: 24px;
            text-align: right;
            border: none;
            border-radius: 5px;
            outline: none;
        }
        .buttons {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            margin-top: 10px;
        }
        button {
            padding: 15px;
            font-size: 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }
        .number { background: #4CAF50; color: white; }
        .operator { background: #FF9800; color: white; }
        .clear { background: #f44336; color: white; }
        .equals { background: #2196F3; color: white; }
        button:hover {
            transform: scale(1.1);
        }
        .history {
            margin-top: 20px;
            padding: 10px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 5px;
            max-height: 150px;
            overflow-y: auto;
        }
    </style>
    <script>
        function insert(value) {
            document.getElementById("screen").value += value;
        }

        function clearScreen() {
            document.getElementById("screen").value = "";
            document.getElementById("result").innerText = "";
        }

        function calculate() {
            let expression = document.getElementById("screen").value;
            if (expression.includes("/0")) {
                document.getElementById("result").innerHTML = "<span style='color:red;'>Error: Cannot divide by zero!</span>";
                return;
            }
            try {
                let result = eval(expression);
                document.getElementById("result").innerText = "Result: " + result;
                document.getElementById("history").innerHTML += `<p>${expression} = <strong>${result}</strong></p>`;
                document.getElementById("screen").value = result;
            } catch (error) {
                document.getElementById("result").innerHTML = "<span style='color:red;'>Invalid Input!</span>";
            }
        }

        document.addEventListener("keydown", function(event) {
            if (event.key === "Enter") {
                calculate();
            } else if (event.key === "Escape") {
                clearScreen();
            }
        });
    </script>
</head>
<body>

    <h1>Simple Calculator</h1>
    <div class="calculator">
        <input type="text" id="screen" class="screen" readonly>
        <div class="buttons">
            <button class="number" onclick="insert('7')">7</button>
            <button class="number" onclick="insert('8')">8</button>
            <button class="number" onclick="insert('9')">9</button>
            <button class="operator" onclick="insert('/')">/</button>
            
            <button class="number" onclick="insert('4')">4</button>
            <button class="number" onclick="insert('5')">5</button>
            <button class="number" onclick="insert('6')">6</button>
            <button class="operator" onclick="insert('*')">×</button>
            
            <button class="number" onclick="insert('1')">1</button>
            <button class="number" onclick="insert('2')">2</button>
            <button class="number" onclick="insert('3')">3</button>
            <button class="operator" onclick="insert('-')">-</button>

            <button class="clear" onclick="clearScreen()">C</button>
            <button class="number" onclick="insert('0')">0</button>
            <button class="equals" onclick="calculate()">=</button>
            <button class="operator" onclick="insert('+')">+</button>
        </div>
    </div>

    <p id="result"></p>
    <div class="history">
        <h3>Calculation History:</h3>
        <div id="history"></div>
    </div>

</body>
</html>
