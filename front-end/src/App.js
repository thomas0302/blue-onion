import React, { useState, useEffect } from "react";
import axios from "axios";

const API_URL = "http://localhost:3000/journal_entries";

const App = () => {
  const [month, setMonth] = useState("2023-01");
  const [journalEntries, setJournalEntries] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchJournalEntries();
  }, [month]);

  const fetchJournalEntries = async () => {
    setLoading(true);
    setError(null);
    try {
      const response = await axios.get(`${API_URL}?month=${month}`);
      setJournalEntries(response.data.journal_entries);
    } catch (err) {
      setError("Failed to load data");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div>
      <h1>Journal Entries</h1>
      <label>Select Month:</label>
      <input
        type="month"
        value={month}
        onChange={(e) => setMonth(e.target.value)}
      />
      {loading && <p>Loading...</p>}
      {error && <p style={{ color: "red" }}>{error}</p>}
      {journalEntries && (
        <table border="1">
          <thead>
            <tr>
              <th>Account</th>
              <th>Debit</th>
              <th>Credit</th>
            </tr>
          </thead>
          <tbody>
            {Object.entries(journalEntries).map(([account, values]) => (
              <tr key={account}>
                <td>{account}</td>
                <td>{Number(values.debit || 0).toFixed(2)}</td>
                <td>{Number(values.credit || 0).toFixed(2)}</td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default App;
