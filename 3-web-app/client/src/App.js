import React from "react";
import Container from "@mui/material/Container";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Selector from "./components/Selector";
import TableTreeView from "./components/TableTreeView";
import Editor from "./components/Editor";
import "./App.css";

function App() {
  const [selectedFactTable, setSelectedFactTable] = React.useState(null);
  const [results, setResults] = React.useState([]);

  return (
    <div className="App">
      <Container>
        <Grid container rowSpacing={1} columnSpacing={2}>
          <Grid item xs={4}>
            <Paper elevation={3}>
              <Selector
                updateSelectedFactTable={setSelectedFactTable}
              ></Selector>
            </Paper>
            <Paper elevation={3}>
              <TableTreeView
                factTableId={selectedFactTable}
                updateResults={setResults}
              ></TableTreeView>
            </Paper>
          </Grid>

          <Grid item xs={8}>
            <Paper elevation={3}>
              <Editor sqlQuery={results.query} />
            </Paper>
            <Paper elevation={3}>data table</Paper>
          </Grid>
        </Grid>
      </Container>
    </div>
  );
}

export default App;
