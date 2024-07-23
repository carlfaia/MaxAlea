#include "c74_min.h"
#include <random>
#include <vector>
#include <sstream>
#include <numeric>
#include <algorithm>

using namespace c74::min;

class alea_markov : public object<alea_markov> {
public:
    MIN_DESCRIPTION {"Generates random states based on a Markov chain"};
    MIN_TAGS {"random, distribution, markov"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random"};

    inlet<> input {this, "(bang) Generate next state"};
    inlet<> state_inlet {this, "(int) Set initial state"};
    outlet<> output {this, "(int) Output current state"};

    alea_markov(const atoms& args = {}) {
        if (args.size() > 0 && args[0].a_type == c74::max::e_max_atomtypes::A_LONG) {
            num_states = args[0].a_w.w_long;
        } else {
            num_states = 3; // Default size if not specified
        }

        transition_matrix.resize(num_states, std::vector<double>(num_states, 1.0 / num_states));

        // Initialize with a random seed
        seed_value = std::random_device{}();
        m_generator.seed(seed_value);
        current_state = 0; // Default initial state
    }

    /**
     * Message to generate the next state based on the current state and the transition matrix.
     */
    message<> bang {this, "bang", "Generate next state",
        MIN_FUNCTION {
            if (num_states == 0) {
                cerr << "Error: Matrix size not set. Use 'size' message first." << endl;
                return {};
            }
            generate_next_state();
            return {};
        }
    };

    /**
     * Message to set the initial state.
     */
    message<> int_msg {this, "int", "Set initial state",
        MIN_FUNCTION {
            if (num_states == 0) {
                cerr << "Error: Matrix size not set. Use 'size' message first." << endl;
                return {};
            }
            if (inlet == 1) {
                int state = args[0];
                if (state >= 1 && state <= num_states) {
                    current_state = state - 1; // Convert to 0-indexed
                } else {
                    cerr << "Error: Invalid state. Must be between 1 and " << num_states << "." << endl;
                }
            }
            return {};
        }
    };

    /**
     * Message to set the seed value for random number generation.
     */
    message<> seed_msg {this, "seed", "Set seed value",
        MIN_FUNCTION {
            seed_value = static_cast<unsigned long>(args[0]);
            m_generator.seed(seed_value);
            return {};
        }
    };

    /**
     * Message to output current state and transition matrix information.
     */
    message<> info {this, "info", "Output current state and transition matrix",
        MIN_FUNCTION {
            if (num_states == 0) {
                cout << "Matrix size not set. Use 'size' message first." << endl;
                return {};
            }
            cout << "alea_markov state:" << endl;
            cout << "  current state: " << (current_state + 1) << endl; // Convert to 1-indexed
            cout << "  seed: " << seed_value << endl;
            cout << "  transition matrix: " << endl;
            for (const auto& row : transition_matrix) {
                for (const auto& prob : row) {
                    cout << prob << " ";
                }
                cout << endl;
            }
            return {};
        }
    };

    /**
     * Message to set the size of the transition matrix and initialize it with equal probabilities.
     */
    message<> size {this, "size", "Set the size of the transition matrix and initialize with equal probabilities",
     MIN_FUNCTION {
         if (args.size() != 1 || args[0].a_type != c74::max::e_max_atomtypes::A_LONG) {
             cerr << "Error: size message expects a single integer argument." << endl;
             return {};
         }
         int new_size = args[0];
         if (new_size <= 0) {
             cerr << "Error: Matrix size must be positive." << endl;
             return {};
         }
         num_states = new_size;

         // Resize and reinitialize the transition matrix
         transition_matrix.clear();
         transition_matrix.resize(num_states, std::vector<double>(num_states, 1.0 / num_states));

         cout << "Matrix size set to " << num_states << "x" << num_states
              << " and initialized with equal probabilities." << endl;

         return {};
     }
    };

    /**
     * Message to set a specific row of the transition matrix.
     */
    message<> set_matrix {this, "set_matrix", "Set a specific row of the transition matrix",
       MIN_FUNCTION {
           if (num_states == 0) {
               cerr << "Error: Matrix size not set. Use 'size' message first." << endl;
               return {};
           }
           if (args.size() < 2 || args[0].a_type != c74::max::e_max_atomtypes::A_LONG) {
               cerr << "Error: set_matrix message expects row number followed by probabilities." << endl;
               return {};
           }

           int row = args[0].a_w.w_long - 1; // Convert from 1-indexed to 0-indexed
           if (row < 0 || row >= num_states) {
               cerr << "Error: Invalid row number. Must be between 1 and " << num_states << "." << endl;
               return {};
           }

            std::vector<double> new_row;
            for (size_t i = 1; i < args.size(); ++i) {
                if (args[i].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                    new_row.push_back(args[i].a_w.w_float);
                } else if (args[i].a_type == c74::max::e_max_atomtypes::A_LONG) {
                    new_row.push_back(static_cast<double>(args[i].a_w.w_long));
                } else {
                    cerr << "Error: Unexpected input type at position " << i << ". Expected number." << endl;
                    return {};
                }
            }

            if (new_row.size() != num_states) {
                cerr << "Error: Expected " << num_states << " values for row " << (row + 1)
                     << ", but received " << new_row.size() << "." << endl;
                return {};
            }

            // Normalize the row
            double row_sum = std::accumulate(new_row.begin(), new_row.end(), 0.0);
            if (std::abs(row_sum - 1.0) > 1e-6) {
                cerr << "Warning: Row " << (row + 1) << " does not sum to 1. Normalizing." << endl;
                for (auto& val : new_row) {
                    val /= row_sum;
                }
            }

            // Update the transition matrix
            transition_matrix[row] = new_row;

            return {};
        }
    };

    /**
     * Message to reset the transition matrix to equal probabilities.
     */
    message<> reset {this, "reset", "Reset the transition matrix to equal probabilities",
        MIN_FUNCTION {
            if (num_states == 0) {
                cerr << "Error: Matrix size not set. Use 'size' message first." << endl;
                return {};
            }
            for (auto& row : transition_matrix) {
                std::fill(row.begin(), row.end(), 1.0 / num_states);
            }
            cout << "Reset transition matrix to equal probabilities." << endl;
            return {};
        }
    };

private:
    /**
     * Generate the next state based on the current state and the transition matrix.
     */
    void generate_next_state() {
        std::uniform_real_distribution<double> dist(0.0, 1.0);
        double rand_val = dist(m_generator);
        double cumulative_prob = 0.0;

        for (int next_state = 0; next_state < num_states; ++next_state) {
            cumulative_prob += transition_matrix[current_state][next_state];
            if (rand_val < cumulative_prob) {
                current_state = next_state;
                break;
            }
        }
        output.send(current_state + 1); // Convert to 1-indexed before sending
    }

    std::mt19937 m_generator;
    int current_state {0}; // Initial state
    unsigned long seed_value {std::random_device{}()};
    int num_states {0}; // Default to 0, indicating size not set
    std::vector<std::vector<double>> transition_matrix; // Transition probability matrix
};

MIN_EXTERNAL(alea_markov);
