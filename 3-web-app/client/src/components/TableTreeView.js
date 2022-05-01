import * as React from "react";
import TreeView from "@mui/lab/TreeView";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import ChevronRightIcon from "@mui/icons-material/ChevronRight";
import TreeItem from "@mui/lab/TreeItem";
import FormGroup from "@mui/material/FormGroup";
import FormControlLabel from "@mui/material/FormControlLabel";
import Checkbox from "@mui/material/Checkbox";
import axios from "axios";

function TableTreeView({ factTableId, updateResults }) {
  // dimensions
  const [uniqueTables, setUniqueTables] = React.useState(new Map());
  const [dimensions, setDimensions] = React.useState([]);
  const [selectedDims, setSelectedDims] = React.useState([]);
  const [checkedDimState, setCheckedDimState] = React.useState([]);

  // measures
  const [measures, setMeasures] = React.useState([]);
  const [selectedMeasures, setSelectedMeasures] = React.useState([]);
  const [checkedMeasuresState, setCheckedMeasuresState] = React.useState([]);

  React.useEffect(() => {
    async function fetchDimensions() {
      if (factTableId === null) return;
      try {
        // fetch from server
        const response = await axios.get(
          `${process.env.REACT_APP_API}/api/dimensions/${factTableId}`
        );
        const data = response.data;
        const results = data.data.results;

        // create tree roots
        const tablesMap = new Map();
        for (const item of results) {
          tablesMap.set(item.sifTablica, item.nazTablica);
        }

        // update default data entries
        setUniqueTables(tablesMap);
        setDimensions(results);
        setSelectedDims(new Array(results.length).fill(null));
        setCheckedDimState(new Array(results.length).fill(false));
      } catch (err) {
        console.error(err);
      }
    }
    async function fetchMeasures() {
      if (factTableId === null) return;
      try {
        // fetch from server
        const response = await axios.get(
          `${process.env.REACT_APP_API}/api/measures/${factTableId}`
        );
        const data = response.data;
        const results = data.data.results;

        // update default data entries
        setMeasures(results);
        setSelectedMeasures(new Array(results.length).fill(null));
        setCheckedMeasuresState(new Array(results.length).fill(false));
      } catch (err) {
        console.error(err);
      }
    }

    fetchMeasures();
    fetchDimensions();
  }, [factTableId]);

  const postToServer = async (requestData) => {
    if (requestData === undefined || requestData === null) return;
    try {
      const response = await axios.post(
        `${process.env.REACT_APP_API}/api/query`,
        requestData
      );
      const data = response.data;

      // re-render
      updateResults(data.data);
    } catch (err) {
      console.error(err);
    }
  };

  const handleDimCheckboxChange = (index) => {
    // update checkbox bool
    const updatedCheckbox = checkedDimState;
    updatedCheckbox[index] = !checkedDimState[index];
    setCheckedDimState(updatedCheckbox);

    // update list of selected dimensions
    const updatedSelectedDims = selectedDims;
    if (updatedSelectedDims[index] === null) {
      updatedSelectedDims[index] = dimensions[index];
    } else {
      updatedSelectedDims[index] = null;
    }
    setSelectedDims(updatedSelectedDims);

    // prepare server request
    const filterMeasures = selectedMeasures.filter((item) => item !== null);
    const filterDimensions = updatedSelectedDims.filter(
      (item) => item !== null
    );
    const requestData = [...filterMeasures, ...filterDimensions];
    postToServer(requestData);
  };

  const handleMeasureCheckboxChange = (index) => {
    // update checkbox bool
    const updatedCheckbox = checkedMeasuresState;
    updatedCheckbox[index] = !checkedMeasuresState[index];
    setCheckedMeasuresState(updatedCheckbox);

    // update list of selected measures
    const updatedSelectedMeasures = selectedMeasures;
    if (updatedSelectedMeasures[index] === null) {
      updatedSelectedMeasures[index] = measures[index];
    } else {
      updatedSelectedMeasures[index] = null;
    }
    setSelectedMeasures(updatedSelectedMeasures);

    // prepare server request
    const filterMeasures = updatedSelectedMeasures.filter(
      (item) => item !== null
    );
    const filterDimensions = selectedDims.filter((item) => item !== null);
    const requestData = [...filterMeasures, ...filterDimensions];
    postToServer(requestData);
  };

  return (
    <div>
      <TreeView
        aria-label="multi-select"
        defaultCollapseIcon={<ExpandMoreIcon />}
        defaultExpandIcon={<ChevronRightIcon />}
        multiSelect
      >
        <TreeItem nodeId={`mes-tree`} label="Mjere">
          {measures.map((item, index) => {
            const nodeId = `${item.sifTablica[0]}-${item.rbrAtrib[0]}-${item.sifAgrFun[0]}`;
            const nodeLabel = (
              <FormGroup>
                <FormControlLabel
                  control={
                    <Checkbox
                      size="small"
                      checked={checkedMeasuresState[index] !== false}
                      onChange={() => handleMeasureCheckboxChange(index)}
                    />
                  }
                  label={item.imeAtrib[1]}
                />
              </FormGroup>
            );
            return <TreeItem nodeId={nodeId} label={nodeLabel}></TreeItem>;
          })}
        </TreeItem>

        <TreeItem nodeId={`dim-tree`} label="Dimenzije" sx={{ pt: 4 }}>
          {[...uniqueTables.keys()].map((dimTableId) => {
            const dimTableName = uniqueTables.get(dimTableId);
            return (
              <TreeItem
                nodeId={`${dimTableId}`}
                label={dimTableName}
                sx={{ padding: 1 }}
              >
                {dimensions.map((item, index) => {
                  if (item.sifTablica === dimTableId) {
                    const nodeId = `${dimTableId}-${item.rbrAtrib}`;
                    const nodeLabel = (
                      <FormGroup>
                        <FormControlLabel
                          control={
                            <Checkbox
                              size="small"
                              checked={checkedDimState[index] !== false}
                              onChange={() => handleDimCheckboxChange(index)}
                            />
                          }
                          label={item.imeAtrib}
                        />
                      </FormGroup>
                    );
                    return (
                      <TreeItem nodeId={nodeId} label={nodeLabel}></TreeItem>
                    );
                  } else {
                    return <></>;
                  }
                })}
              </TreeItem>
            );
          })}
        </TreeItem>
      </TreeView>
    </div>
  );
}

export default TableTreeView;
