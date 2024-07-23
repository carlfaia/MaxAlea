autowatch = 1;
outlets = 4; // Four outlets: main output, size output, dictionary output, coll output

var items = [];
var itemIndices = {};
var transitions = {};
var lastPair = [null, null];
var maxItems = 1000;

// Handles any input received
function anything() {
    var input;
    if (arguments.length === 0 && typeof messagename === "string") {
        input = messagename;
    } else if (arguments.length > 0) {
        input = Array.prototype.slice.call(arguments).join(" ");
        if (typeof messagename === "string" && messagename !== "list") {
            input = messagename + " " + input;
        }
    } else {
        post("Error: Empty input received\n");
        return;
    }
    
    if (input === "dumpout") {
        dumpCorrelationMatrix();
    } else {
        processItem(input);
    }
}

// Processes an integer input
function msg_int(value) {
    processItem(value);
}

// Processes a float input
function msg_float(value) {
    processItem(value);
}

// Processes an input item
function processItem(item) {
    if (Object.keys(itemIndices).length >= maxItems && !(item in itemIndices)) {
        post("Maximum number of unique items reached. Ignoring new item.\n");
        return;
    }

    if (!(item in itemIndices)) {
        itemIndices[item] = items.length;
        items.push(item);
    }

    if (lastPair[0] !== null && lastPair[1] !== null) {
        var transitionKey = lastPair[0] + "," + lastPair[1] + "->" + item;
        transitions[transitionKey] = (transitions[transitionKey] || 0) + 1;
    }

    lastPair[0] = lastPair[1];
    lastPair[1] = item;
    printState();
}

// Dumps the correlation matrix to a dictionary
function dumpCorrelationMatrix() {
    if (items.length === 0) {
        post("No data to analyze. Matrix is empty.\n");
        return;
    }

    var dict = new Dict("correlation_matrix");
    dict.clear();

    var itemsArray = [];
    for (var i = 0; i < items.length; i++) {
        itemsArray.push(items[i]);
    }
    dict.set("items", itemsArray);

    var transitionsDict = new Dict();
    for (var transition in transitions) {
        transitionsDict.set(transition, transitions[transition]);
    }
    dict.set("transitions", transitionsDict);

    var matrix = calculateTransitionMatrix();
    var matrixDict = new Dict();
    for (var i = 0; i < matrix.length; i++) {
        for (var j = 0; j < matrix[i].length; j++) {
            var row = matrix[i][j].map(function(val) { return parseFloat(val.toFixed(4)); });
            matrixDict.set(i + "," + j, row);
        }
    }
    dict.set("matrix", matrixDict);

    outlet(2, "dictionary", dict.name);
    post("Correlation matrix output as dictionary: " + dict.name + "\n");

    // Clear the coll before formatting new data
    outlet(3, "clear");

    var collData = formatDictForColl();
    for (var i = 0; i < collData.length; i++) {
        var parts = collData[i].split(" ");
        var rowNumber = parseInt(parts[0]);
        var values = parts.slice(1).map(function(val) {
            var num = parseFloat(val);
            return isNaN(num) ? val : num; // Convert to number if possible
        });
        outlet(3, rowNumber, values);
    }

    post("Correlation matrix output for coll:\n");
    post(collData.join("\n") + "\n");
}

// Prints the current state to the console
function printState() {
    post("Current state:\n");
    post("Max items: " + maxItems + "\n");
    post("Items: " + items.join(" ") + "\n");
    post("Transitions:\n");
    for (var transition in transitions) {
        var parts = transition.split("->");
        var from = parts[0].split(",");
        var to = parts[1];
        post("From [" + from[0] + ", " + from[1] + "] to " + to + " count: " + transitions[transition] + "\n");
    }
}

// Generates the transition matrix and sends it out the main outlet
function bang() {
    var matrix = calculateTransitionMatrix();
    if (matrix.length === 0) {
        post("No data to analyze. Matrix is empty.\n");
        return;
    }

    post("Transition Matrix:\n");
    for (var i = 0; i < matrix.length; i++) {
        for (var j = 0; j < matrix[i].length; j++) {
            var row = matrix[i][j].map(function(val) { return parseFloat(val.toFixed(4)); });
            var message = ["set_matrix", i + 1, j + 1].concat(row);
            outlet(0, message);
        }
    }
}

// Calculates the transition matrix
function calculateTransitionMatrix() {
    var n = items.length;
    if (n === 0) return [];

    var matrix = [];
    for (var i = 0; i < n; i++) {
        matrix[i] = [];
        for (var j = 0; j < n; j++) {
            matrix[i][j] = [];
            for (var k = 0; k < n; k++) {
                matrix[i][j][k] = 0;
            }
        }
    }

    for (var transition in transitions) {
        var parts = transition.split("->");
        var from = parts[0].split(",");
        var to = parts[1];
        var i = itemIndices[from[0]];
        var j = itemIndices[from[1]];
        var k = itemIndices[to];
        matrix[i][j][k] = transitions[transition];
    }

    for (var i = 0; i < n; i++) {
        for (var j = 0; j < n; j++) {
            var rowSum = 0;
            for (var k = 0; k < n; k++) {
                rowSum += matrix[i][j][k];
            }
            if (rowSum > 0) {
                for (var k = 0; k < n; k++) {
                    matrix[i][j][k] /= rowSum;
                }
            } else {
                for (var k = 0; k < n; k++) {
                    matrix[i][j][k] = 1 / n;
                }
            }
        }
    }

    return matrix;
}

// Clears all stored data
function clear() {
    post("Clearing all stored data\n");
    items = [];
    itemIndices = {};
    transitions = {};
    lastPair = [null, null];
}

// Outputs the current size of the matrix
function get_size() {
    var size = items.length;
    post("Current size of the matrix: " + size + "\n");
    outlet(1, size); // Output the size to the middle outlet
}

// Sets the maximum number of unique items
function setMaxItems(max) {
    if (max > 0) {
        maxItems = max;
        post("Maximum number of unique items set to: " + maxItems + "\n");
    } else {
        post("Maximum number of unique items must be positive.\n");
    }
}

// Formats the dictionary data for coll output
function formatDictForColl() {
    var collData = [];
    for (var i = 0; i < items.length; i++) {
        var line = (i + 1) + " " + items[i];
        collData.push(line);
    }
    return collData;
}
