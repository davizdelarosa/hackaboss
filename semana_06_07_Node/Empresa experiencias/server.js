const express = require('express');

const app = express();

app.use((req, res) => {
  res.status(404);

  res.send({
    status: 'Error',
    message: 'Not found',
  })
})

app.listen(4000, () => {
  console.log(`Server listening at http://localhost:4000`);
})