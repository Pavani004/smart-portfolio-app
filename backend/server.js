const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

mongoose.connect('mongodb://mongo:27017/portfolioDB', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const portfolioSchema = new mongoose.Schema({
  name: String,
  role: String,
});

const Portfolio = mongoose.model('Portfolio', portfolioSchema);

app.get('/api/portfolio', async (req, res) => {
  const data = await Portfolio.find();
  res.json(data);
});

app.post('/api/portfolio', async (req, res) => {
  const entry = new Portfolio(req.body);
  await entry.save();
  res.json(entry);
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
