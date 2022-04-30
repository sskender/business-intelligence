import * as React from "react";

function Editor({ sqlQuery }) {
  return (
    <div className="display-linebreak">
      SQL:
      <span>{sqlQuery}</span>
    </div>
  );
}

export default Editor;
