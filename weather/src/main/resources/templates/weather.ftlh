<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather</title>
    <link rel="stylesheet" href="style.css">
</head>
<style>
* {
    box-sizing: border-box;
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
.weather {
    text-align: center;
    font-size: 2rem;
    color: white;
}

.button-71 {
  background-color: #0078d0;
  border: 0;
  border-radius: 56px;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  font-family: system-ui,-apple-system,system-ui,"Segoe UI",Roboto,Ubuntu,"Helvetica Neue",sans-serif;
  font-size: 18px;
  font-weight: 600;
  outline: 0;
  padding: 16px 21px;
  position: relative;
  text-align: center;
  text-decoration: none;
  transition: all .3s;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button-71:before {
  background-color: initial;
  background-image: linear-gradient(#fff 0, rgba(255, 255, 255, 0) 100%);
  border-radius: 125px;
  content: "";
  height: 50%;
  left: 4%;
  opacity: .5;
  position: absolute;
  top: 0;
  transition: all .3s;
  width: 92%;
}

.button-71:hover {
  box-shadow: rgba(255, 255, 255, .2) 0 3px 15px inset, rgba(0, 0, 0, .1) 0 3px 5px, rgba(0, 0, 0, .1) 0 10px 13px;
  transform: scale(1.05);
}

@media (min-width: 768px) {
  .button-71 {
    padding: 16px 48px;
  }
}
.header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #f5f5f5;
        padding: 20px 30px;
        box-shadow: 0px 1px 5px rgba(0,0,0,0.1);
        }
.header h1 {
    margin: 0;
    font-size: 1.5em;
    color: #333;
}
.header form {
    display: flex;
    align-items: center;
}
.header form input[type="text"] {
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 10px;
    margin-right: 10px;
}
.header form button {
    padding: 10px 20px;
    border: none;
    background-color: #007BFF;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
}
#background {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    z-index: -1;
    filter: blur(10px);
}
html::after {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: inherit;
    filter: blur(10px);
    z-index: -1;
}
</style>
<body>
        <div id="background" style="background-image: url('${imageUrl}');"></div>
        <div class="header">
        <h1>Weather Forecast</h1>
        <form action="/" method="post">
            <input type="text" name="city" placeholder="Search city" value="${city}">
            <button class="button-71" type="submit" role="button">Get Weather</button>
        </form>
    </div>
    <div class="weather">
        <h2>${forecast.city}</h2>
        <p>${forecast.description}</p>
        <p>${forecast.temperature} &#8451;</p>
    </div>
</body>



</html>
