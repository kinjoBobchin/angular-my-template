const express = require('express');
const compression = require('compression');
const path = require('path');

const app = express();
const port = process.env.PORT || 8080;

// GZip
app.use(compression());

app.use(express.static(__dirname + '/../dist'));

app.listen(port);

app.get('/*', (req, res) => {
  res.sendFile(path.join(__dirname + '/../dist/index.html'));
});

console.log(`Server listening on ${port}`);
