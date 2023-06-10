<!DOCTYPE html>
<html>
<head>
    <title>Weather Forecast</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: "Poppins", sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            flex-direction: column;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }
        input {
            padding: 1rem;
            border-radius: 25px;
            border: none;
            background-color: #fff;
            font-family: inherit;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            min-width: 300px;
            font-size: 1rem;
        }
        input:focus {
            outline: none;
        }
        button {
            padding: 0.5rem 1rem;
            border-radius: 25px;
            border: none;
            background-color: #0099ff;
            color: white;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }
        button:hover {
            background-color: #007acc;
        }
    </style>
</head>
<body>
    <h1>Enter a City Name</h1>
    <form action="/" method="post">
        <input type="text" name="city" placeholder="City" value="${city}">
        <button type="submit">Get Weather</button>
    </form>
</body>
</html>
