const data = require("./app.json");

let level = 0;

function spacer(level) {
  return "  ".repeat(level);
}

function parse(data, level) {
  const skipKeys = ["widget"];
  const className = data["widget"];
  let widget = `${className}(\n`;

  Object.keys(data).forEach(key => {
    if (skipKeys.includes(key)) {
      return;
    }

    const value = data[key];
    if (typeof value === "object" && !Array.isArray(value)) {
      level += 1;
      widget += `${spacer(level)}${key}: ${parse(value, level)},\n`;
      level -= 1;
    } else {
      level += 1;
      if (key === "arguments") {
        value.forEach(argument => {
          widget += `${spacer(level)}${argument},\n`;
        });
      } else {
        widget += `${spacer(level)}${key}: ${value},\n`;
      }
      level -= 1;
    }
  });

  return widget + `${spacer(level)})`;
}

console.log(parse(data, level));
