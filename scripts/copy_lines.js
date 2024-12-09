#!/usr/bin/env node

console.log("running");

const fs = require("fs");
const readline = require("readline");
const { execSync } = require("child_process");

// Check if the file path is provided
if (process.argv.length < 3) {
  console.error("Usage: node script.js <file-path>");
  process.exit(1);
}

const filePath = process.argv[2];

// Create a read stream
const readStream = fs.createReadStream(filePath);

const rl = readline.createInterface({
  input: readStream,
  crlfDelay: Infinity,
});

let lines = [];

rl.on("line", (line) => {
  const trimmedLine = line.trim();
  if (trimmedLine) {
    lines.push(trimmedLine);
  }
});

rl.on("close", () => {
  lines.forEach((line) => {
    execSync(`echo -n "${line}" | xclip -selection clipboard`, {
      stdio: "ignore",
    });
  });
  console.log("Copied to clipboard!");
});
