import fs from "fs";
import yaml from "js-yaml";
import path from "path";

const westYaml = yaml.load(
  fs.readFileSync(path.join(process.cwd(), "west.yml"), "utf-8")
);

process.stdout.write(
  westYaml.manifest.projects.find(({ name }) => name === "sdk-nrf").revision
);
