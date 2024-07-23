#include "c74_min.h"
#include <random>

using namespace c74::min;

class alea_choice : public object<alea_choice> {
public:
    MIN_DESCRIPTION {"Generates a random choice between two options based on a weight"};
    MIN_TAGS {"random, choice"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random, choice"};

    inlet<> input_trigger {this, "(bang) Trigger random choice"};
    inlet<> input_weight {this, "(float) Weight value"};
    inlet<> input_A {this, "(anything) Choice A"};
    inlet<> input_B {this, "(anything) Choice B"};
    outlet<> output {this, "(anything) Output based on random choice"};

    attribute<double> weight {this, "weight", 0.5,
        description {"Weight for choice selection (0.0 to 1.0)"},
        setter { MIN_FUNCTION {
            double w = args[0];
            return {clamp(w, 0.0, 1.0)};
        }}
    };

    alea_choice(const atoms& args = {}) {
        if (args.size() > 0) {
            if (args[0].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                weight = args[0];
            }
            if (args.size() > 1) {
                m_choice_A = {args[1]};
            }
            if (args.size() > 2) {
                m_choice_B = {args[2]};
            }
        }
        m_generator.seed(std::random_device{}());
    }

    message<> bang {this, "bang", "Generate random choice",
        MIN_FUNCTION {
            make_choice();
            return {};
        }
    };

    message<> number {this, "number", "Set weight or choice",
        MIN_FUNCTION {
            int inlet_index = inlet;
            if (inlet_index == 1) {
                weight = args[0];
            } else if (inlet_index == 2) {
                m_choice_A = args;
            } else if (inlet_index == 3) {
                m_choice_B = args;
            }
            return {};
        }
    };

    message<> list {this, "list", "Set choice A or B",
        MIN_FUNCTION {
            int inlet_index = inlet;
            if (inlet_index == 2) {
                m_choice_A = args;
            } else if (inlet_index == 3) {
                m_choice_B = args;
            }
            return {};
        }
    };

    message<> anything {this, "anything", "Set choice A or B",
        MIN_FUNCTION {
            int inlet_index = inlet;
            if (inlet_index == 2) {
                m_choice_A = {args[0]};
                for (int i = 1; i < args.size(); ++i) {
                    m_choice_A.push_back(args[i]);
                }
            } else if (inlet_index == 3) {
                m_choice_B = {args[0]};
                for (int i = 1; i < args.size(); ++i) {
                    m_choice_B.push_back(args[i]);
                }
            }
            return {};
        }
    };

private:
    void make_choice() {
        std::uniform_real_distribution<double> distribution(0.0, 1.0);
        double random_value = distribution(m_generator);

        if (random_value < weight) {
            output_choice(m_choice_A);
        } else {
            output_choice(m_choice_B);
        }
    }

    void output_choice(const atoms& choice) {
        if (choice.empty()) {
            return;
        }
        if (choice.size() == 1) {
            if (choice[0].a_type == c74::max::e_max_atomtypes::A_LONG) {
                output.send(choice[0].a_w.w_long);
            } else if (choice[0].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                output.send(choice[0].a_w.w_float);
            } else if (choice[0].a_type == c74::max::e_max_atomtypes::A_SYM) {
                output.send(choice[0].a_w.w_sym);
            }
        } else {
            output.send(choice);
        }
    }

    std::mt19937 m_generator;
    atoms m_choice_A;
    atoms m_choice_B;
};

MIN_EXTERNAL(alea_choice);