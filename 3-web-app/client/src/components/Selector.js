import * as React from "react";
import Radio from "@mui/material/Radio";
import RadioGroup from "@mui/material/RadioGroup";
import FormControlLabel from "@mui/material/FormControlLabel";
import FormControl from "@mui/material/FormControl";
import FormLabel from "@mui/material/FormLabel";
import axios from "axios";

function Selector({ updateSelectedFactTable }) {
  const [factTables, setFactTables] = React.useState([]);

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
      } catch (err) {
        console.error(err);
      }
    }

    fetchFactTables();
  }, [updateSelectedFactTable]);

  const handleFactTableChange = (event) => {
    updateSelectedFactTable(event.target.value);
  };

  return (
    <div>
      <FormControl>
        <FormLabel>Činjenična tablica:</FormLabel>
        <RadioGroup
          name="controlled-radio-buttons-group"
          onChange={handleFactTableChange}
        >
          {factTables.map((item) => {
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

export default Selector;
