import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers";

const application = Application.start();

import { Tabs } from "tailwindcss-stimulus-components";

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;
application.register("tabs", Tabs);
const context = require.context("./controllers", true, /\.js$/);
Stimulus.load(definitionsFromContext(context));
export { application };
