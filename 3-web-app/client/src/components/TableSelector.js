import * as React from "react";
import Radio from "@mui/material/Radio";
import RadioGroup from "@mui/material/RadioGroup";
import FormControlLabel from "@mui/material/FormControlLabel";
import FormControl from "@mui/material/FormControl";
import FormLabel from "@mui/material/FormLabel";
import axios from "axios";

function TableSelector({ updateSelectedFactTable, updateResults }) {
  const [factTables, setFactTables] = React.useState([]);
  const [defaultFactTable, setDefaultFactTable] = React.useState(null);

  React.useEffect(() => {
    async function fetchFactTables() {
      try {
        // fetch from server
        const response = await axios.get(
          `${process.env.REACT_APP_API}/api/tables`
        );
        const data = response.data;
        const results = data.data.results;

        // update default data entries
        setFactTables(results);
        updateResults({});
        if (results.length > 0) {
          setDefaultFactTable(results[0]?.sifTablica);
          updateSelectedFactTable(results[0]?.sifTablica);
        }
      } catch (err) {
        console.error(err);
      }
    }

    fetchFactTables();
  }, [updateSelectedFactTable, updateResults]);

  const handleFactTableChange = (event) => {
    setDefaultFactTable(event.target.value);
    updateSelectedFactTable(event.target.value);
    updateResults({});
  };

  return (
    <div>
      <FormControl>
        <FormLabel>Činjenična tablica:</FormLabel>
        <RadioGroup
          name="controlled-radio-buttons-group"
          onChange={handleFactTableChange}
          value={defaultFactTable}
        >
          {factTables?.map((item) => {
            return (
              <FormControlLabel
                value={item.sifTablica}
                control={<Radio />}
                label={item.nazTablica}
              />
            );
          })}
        </RadioGroup>
      </FormControl>
    </div>
  );
}

export default TableSelector;
