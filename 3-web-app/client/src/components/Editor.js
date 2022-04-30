import * as React from "react";

function Editor({ sqlQuery }) {
  return (
    <div>
      SQL:
      <span>{sqlQuery}</span>
    </div>
  );
}

export default Editor;
