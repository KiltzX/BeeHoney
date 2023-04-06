const express = require('express');
const Base64 = require('js-base64').Base64;

const app = express();
const PORT = 3000;

const random = () => {
    return Math.floor(Math.random() * 10);
}

app.get("/*/*", (req, res) => {
    res.setHeader("Content-Type", "text/html");
    res.setHeader("Content-Length", "200")
    res.setHeader("Access-Control-Allow-Origin", "DENY")
    const times = Math.floor(Math.random() * 10);
    var text = ''
    for(let i = 0; i < times; i++) {
        text += Base64.encode(`${random()}`)
    }
    res.send(text);
})
  
app.listen(PORT, (error) =>{
    if(error) {
        console.log(error)
        return console.log("Error occurred, server can't start", error);
    }
    console.log(`Server is listening on port ${PORT}`);
});