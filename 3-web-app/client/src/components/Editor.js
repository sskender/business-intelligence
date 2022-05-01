import * as React from "react";
import Box from "@mui/material/Box";
import TextField from "@mui/material/TextField";

function Editor({ sqlQuery }) {
  return (
    <Box noValidate autoComplete="off" sx={{ maxWidth: "100%" }}>
      <TextField
        id="outlined-multiline-static"
        label="SQL Query"
        multiline
        value={sqlQuery}
        fullWidth
        InputProps={{
          readOnly: true,
          style: {
            readOnly: true,
            fontFamily: "Monospace",
            color: "green",
          },
        }}
        sx={{ maxWidth: "100%", maxHeight: "100%" }}
      />
    </Box>
  );
}

export default Editor;
