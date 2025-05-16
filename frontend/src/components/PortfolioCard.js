import React from 'react';

const PortfolioCard = ({ name, role }) => (
  <div style={{
    border: '1px solid #ccc',
    padding: '1rem',
    borderRadius: '8px',
    marginTop: '1rem'
  }}>
    <h2>{name}</h2>
    <p>{role}</p>
  </div>
);

export default PortfolioCard;
