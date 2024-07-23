#include "c74_min.h"
#include <random>
#include <vector>

using namespace c74::min;

class alea_multi_choice : public object<alea_multi_choice> {
public:
    MIN_DESCRIPTION {"Generates a random choice between multiple options with optional weights"};
    MIN_TAGS {"random, choice, weighted"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random, choice"};

    inlet<> input_trigger {this, "(bang) Trigger random choice"};
    std::vector<std::unique_ptr<inlet<>>> choice_inlets;
    outlet<> output {this, "(anything) Output based on random choice"};

    alea_multi_choice(const atoms& args = {2}) {
        long num_choices = 2;  // Default to 2 choices
        if (!args.empty() && args[0].a_type == c74::max::e_max_atomtypes::A_LONG) {
            num_choices = args[0];
        }
        num_choices = std::max(2L, std::min(num_choices, 64L));  // Limit between 2 and 64

        for (long i = 0; i < num_choices; ++i) {
            choice_inlets.push_back(std::make_unique<inlet<>>(this, "(anything) Choice " + std::to_string(i + 1)));
        }

        m_choices.resize(num_choices);
        m_weights.resize(num_choices, 1.0);

        m_generator.seed(std::random_device{}());
    }

    message<> bang {this, "bang", "Generate random choice",
        MIN_FUNCTION {
            make_choice();
            return {};
        }
    };

    message<> weights {this, "weights", "Set weights for choices",
        MIN_FUNCTION {
            std::vector<double> new_weights;
            for (const auto& arg : args) {
                if (arg.a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                    new_weights.push_back(arg);
                } else if (arg.a_type == c74::max::e_max_atomtypes::A_LONG) {
                    new_weights.push_back(static_cast<double>(arg));
                } else {
                    cerr << "Ignoring non-numeric weight value." << c74::min::endl;
                }
            }

            if (new_weights.size() > m_weights.size()) {
                cerr << "Truncating weights list to " << m_weights.size() << " values." << c74::min::endl;
                new_weights.resize(m_weights.size());
            } else if (new_weights.size() < m_weights.size()) {
                cerr << "Not enough weights provided. Expected " << m_weights.size() << ", got " << new_weights.size() << "." << c74::min::endl;
                return {};
            }

            m_weights = new_weights;
            return {};
        }
    };

    message<> reset_warning {this, "reset_warning", "Reset the empty choice warning",
        MIN_FUNCTION {
            empty_choice_warning_sent = false;
            return {};
        }
    };

    message<> int_msg {this, "int", "Set choice for an inlet (integer)",
        MIN_FUNCTION {
            long inlet_index = static_cast<long>(inlet) - 1;  // Adjust for trigger inlet
            if (inlet_index >= 0 && inlet_index < m_choices.size()) {
                m_choices[inlet_index] = {args[0]};
                empty_choice_warning_sent = false;  // Reset warning flag when a choice is set
            }
            return {};
        }
    };

    message<> float_msg {this, "float", "Set choice for an inlet (float)",
        MIN_FUNCTION {
            long inlet_index = static_cast<long>(inlet) - 1;  // Adjust for trigger inlet
            if (inlet_index >= 0 && inlet_index < m_choices.size()) {
                m_choices[inlet_index] = {args[0]};
                empty_choice_warning_sent = false;  // Reset warning flag when a choice is set
            }
            return {};
        }
    };

    message<> anything {this, "anything", "Set choice for an inlet",
        MIN_FUNCTION {
            long inlet_index = static_cast<long>(inlet) - 1;  // Adjust for trigger inlet
            if (inlet_index >= 0 && inlet_index < m_choices.size()) {
                m_choices[inlet_index] = args;
                empty_choice_warning_sent = false;  // Reset warning flag when a choice is set
            }
            return {};
        }
    };

    message<> info {this, "info", "Output current state",
        MIN_FUNCTION {
            cout << "alea_multi_choice state:" << endl;
            cout << "  Number of choices: " << m_choices.size() << endl;
            cout << "  Weights: ";
            for (const auto& weight : m_weights) {
                cout << weight << " ";
            }
            cout << endl;
            cout << "  Choices: " << endl;
            for (size_t i = 0; i < m_choices.size(); ++i) {
                cout << "    Choice " << i + 1 << ": ";
                for (const auto& atom : m_choices[i]) {
                    cout << atom << " ";
                }
                cout << endl;
            }
            cout << "  Seed: " << seed_value << endl;
            return {};
        }
    };

    message<> seed {this, "seed", "Set seed value",
        MIN_FUNCTION {
            if (args.size() > 0) {
                seed_value = static_cast<unsigned long>(args[0]);
                m_generator.seed(seed_value);
            }
            return {};
        }
    };

private:
    void make_choice() {
        bool has_empty_choice = false;
        for (const auto& choice : m_choices) {
            if (choice.empty()) {
                has_empty_choice = true;
                break;
            }
        }

        if (has_empty_choice && !empty_choice_warning_sent) {
            cerr << "Warning: One or more choices are empty. Outputting 0 for empty choices." << c74::min::endl;
            empty_choice_warning_sent = true;
        }

        std::discrete_distribution<> distribution(m_weights.begin(), m_weights.end());
        int chosen_index = distribution(m_generator);
        output_choice(m_choices[chosen_index], chosen_index);
    }

    void output_choice(const atoms& choice, int index) {
        if (choice.empty()) {
            output.send(0);
        } else if (choice.size() == 1) {
            output.send(choice[0]);
        } else {
            output.send(choice);
        }
    }

    std::mt19937 m_generator;
    std::vector<atoms> m_choices;
    std::vector<double> m_weights;
    bool empty_choice_warning_sent = false;
    unsigned long seed_value {std::random_device{}()};
};

MIN_EXTERNAL(alea_multi_choice);
