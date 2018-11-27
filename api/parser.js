// const data = require("./app.json");

class Parser {
  constructor() {
    this.level = 0;
  }

  spacer() {
    return "  ".repeat(this.level);
  }

  parse(data) {
    const skipKeys = ["widget"];
    const className = data["widget"];
    let widget = `${className}(\n`;

    Object.keys(data).forEach(key => {
      if (skipKeys.includes(key)) {
        return;
      }

      const value = data[key];
      if (typeof value === "object" && !Array.isArray(value)) {
        this.level += 1;
        widget += `${this.spacer()}${key}: ${this.parse(value)},\n`;
        this.level -= 1;
      } else {
        this.level += 1;
        if (key === "arguments") {
          value.forEach(argument => {
            widget += `${this.spacer()}${argument},\n`;
          });
        } else {
          widget += `${this.spacer()}${key}: ${value},\n`;
        }
        this.level -= 1;
      }
    });

    return widget + `${this.spacer()})`;
  }
}

// console.log(parse(data, level));
