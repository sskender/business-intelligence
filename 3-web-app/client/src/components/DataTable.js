import * as React from "react";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";

function DataTable({ data }) {
  const [header, setHeader] = React.useState([]);

  React.useEffect(() => {
    if (data === undefined || data === null) return;
    setHeader([]);
    if (data.length > 0) {
      setHeader(Object.keys(data[0]));
    }
  }, [data]);

  const noDataMessage = (
    <Typography
      variant="subtitle1"
      gutterBottom
      component="div"
      sx={{ padding: 2 }}
    >
      No data to display
    </Typography>
  );
  const dataTable = (
    <TableContainer component={Paper}>
      <Table aria-label="simple table">
        <TableHead>
          <TableRow>
            {header.map((title) => {
              return <TableCell align="left">{title}</TableCell>;
            })}
          </TableRow>
        </TableHead>
        <TableBody>
          {data?.map((row) => (
            <TableRow
              key={row.name}
              sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
            >
              {Object.keys(row).map((key) => {
                return <TableCell align="left">{row[key]}</TableCell>;
              })}
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );

  if (data?.length > 0) {
    return dataTable;
  } else {
    return noDataMessage;
  }
}

export default DataTable;
