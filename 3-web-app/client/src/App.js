import React from "react";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import TableSelector from "./components/TableSelector";
import TableTreeView from "./components/TableTreeView";
import Editor from "./components/Editor";
import DataTable from "./components/DataTable";
import "./App.css";

function App() {
  const [selectedFactTable, setSelectedFactTable] = React.useState(null);
  const [results, setResults] = React.useState([]);

  return (
    <div className="App">
      <Grid container rowSpacing={1} columnSpacing={1} sx={{ padding: 2 }}>
        <Grid item xs={4}>
          <Paper elevation={8} sx={{ mt: 4, padding: 2, paddingLeft: 4 }}>
            <TableSelector
              updateSelectedFactTable={setSelectedFactTable}
            ></TableSelector>
          </Paper>
          <Paper elevation={8} sx={{ mt: 2, padding: 2 }}>
            <TableTreeView
              factTableId={selectedFactTable}
              updateResults={setResults}
            ></TableTreeView>
          </Paper>
        </Grid>

        <Grid item xs={8}>
          <Paper elevation={8} sx={{ mt: 4, ml: 2, padding: 2 }}>
            <Editor sqlQuery={results.query} />
          </Paper>
          <Paper elevation={8} sx={{ mt: 4, ml: 2, padding: 1 }}>
            <DataTable data={results.results}></DataTable>
          </Paper>
        </Grid>
      </Grid>
    </div>
  );
}

export default App;
