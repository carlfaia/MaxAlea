#include "c74_min.h"
#include <vector>
#include <map>
#include <algorithm>
#include <iostream>
#include <sstream>

using namespace c74::min;

class alea_analyzer : public object<alea_analyzer> {
public:
    MIN_DESCRIPTION {"Analyzes input for Markov chain transitions"};
    MIN_TAGS {"analyzer, markov, statistics"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"anal"};

    inlet<> input {this, "(int) Input to analyze"};
    outlet<> output {this, "(list) Markov transition matrix"};

    alea_analyzer(const atoms& args = {}) {
        if (args.size() > 0 && args[0].a_type == c74::max::e_max_atomtypes::A_LONG) {
            m_max_items = args[0];
        }
        cout << "Object initialized with max items: " << m_max_items << endl;
    }

    message<> int_msg {this, "int", "Analyze integer input",
        MIN_FUNCTION {
            cout << "Received int message: " << args[0] << endl;
            process_item(args[0].a_w.w_long);
            return {};
        }
    };

    message<> bang {this, "bang", "Output analysis results",
        MIN_FUNCTION {
            cout << "Bang message received, calculating transition matrix" << endl;
            std::vector<std::vector<double>> matrix = calculate_transition_matrix();

            if (matrix.empty()) {
                cerr << "No data to analyze. Matrix is empty." << endl;
                return {};
            }

            for (size_t i = 0; i < matrix.size(); ++i) {
                atoms message;
                message.push_back("set_matrix");
                message.push_back(static_cast<int>(i + 1));  // Row number
                for (double val : matrix[i]) {
                    message.push_back(val);
                }
                output.send(message);
            }

            return {};
        }
    };

    message<> clear {this, "clear", "Clear stored data",
        MIN_FUNCTION {
            cout << "Clearing all stored data" << endl;
            m_items.clear();
            m_item_indices.clear();
            m_transitions.clear();
            m_has_last_item = false;
            return {};
        }
    };

    message<> size {this, "size", "Output current size of the matrix",
        MIN_FUNCTION {
            cout << "Current size of the matrix: " << m_items.size() << endl;
            output.send(static_cast<int>(m_items.size()));
            return {};
        }
    };

    message<> set_max_items {this, "max_items", "Set maximum number of unique items",
        MIN_FUNCTION {
            int new_max = args[0];
            if (new_max > 0) {
                m_max_items = new_max;
                cout << "Maximum number of unique items set to: " << m_max_items << endl;
            } else {
                cerr << "Maximum number of unique items must be positive." << endl;
            }
            return {};
        }
    };

private:
    std::vector<int> m_items;
    std::map<int, size_t> m_item_indices;
    std::map<std::pair<int, int>, int> m_transitions;
    int m_last_item;
    bool m_has_last_item = false;
    size_t m_max_items = 1000;

    void process_item(int item) {
        cout << "Processing item: " << item << endl;

        if (m_item_indices.find(item) == m_item_indices.end() && m_item_indices.size() >= m_max_items) {
            cerr << "Maximum number of unique items reached. Ignoring new item." << endl;
            return;
        }

        if (m_item_indices.find(item) == m_item_indices.end()) {
            cout << "Adding new item: " << item << endl;
            m_item_indices[item] = m_items.size();
            m_items.push_back(item);
        }

        if (m_has_last_item) {
            cout << "Adding transition from: " << m_last_item << " to: " << item << endl;
            m_transitions[{m_last_item, item}]++;
        }

        m_last_item = item;
        m_has_last_item = true;
        print_state();
    }

    void print_state() {
        cout << "Current state:" << endl;
        cout << "Items:" << endl;
        for (const auto& item : m_items) {
            cout << item << " ";
        }
        cout << endl;
        cout << "Transitions:" << endl;
        for (const auto& trans : m_transitions) {
            cout << "From " << trans.first.first << " to " << trans.first.second << " count: " << trans.second << endl;
        }
    }

    std::vector<std::vector<double>> calculate_transition_matrix() {
        size_t n = m_items.size();
        if (n == 0) {
            return {};
        }

        std::vector<std::vector<double>> matrix(n, std::vector<double>(n, 0.0));

        for (size_t i = 0; i < n; ++i) {
            double row_sum = 0.0;
            for (size_t j = 0; j < n; ++j) {
                double count = m_transitions[{m_items[i], m_items[j]}];
                matrix[i][j] = count;
                row_sum += count;
            }
            if (row_sum > 0) {
                for (size_t j = 0; j < n; ++j) {
                    matrix[i][j] /= row_sum;
                }
            } else {
                for (size_t j = 0; j < n; ++j) {
                    matrix[i][j] = 1.0 / n;
                }
            }
        }

        return matrix;
    }
};

MIN_EXTERNAL(alea_analyzer);
