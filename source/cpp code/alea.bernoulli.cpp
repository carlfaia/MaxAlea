#include "c74_min.h"
#include <random>

using namespace c74::min;

class alea_bernoulli : public object<alea_bernoulli> {
public:
    MIN_DESCRIPTION {"Generates random values from a Bernoulli distribution"};
    MIN_TAGS {"random, distribution"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random"};

    inlet<> input {this, "(bang) Generate random value"};
    inlet<> p_inlet {this, "(float) Set probability parameter (p)"};
    outlet<> output {this, "(int) Output random value"};

    alea_bernoulli(const atoms& args = {}) {
        if (args.size() > 0) {
            if (args[0].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                p = args[0];
            }
            else if (args[0].a_type == c74::max::e_max_atomtypes::A_LONG) {
                p = static_cast<double>(args[0].a_w.w_long);
            }
        }

        // Initialize with a random seed
        seed_value = std::random_device{}();
        m_generator.seed(seed_value);
    }

    message<> bang {this, "bang", "Generate random value",
        MIN_FUNCTION {
            generate_random_value();
            return {};
        }
    };

    message<> float_msg {this, "float", "Set probability parameter (p)",
        MIN_FUNCTION {
            if (inlet == 1) {
                p = args[0];
            }
            return {};
        }
    };

    message<> int_msg {this, "int", "Set probability parameter (p)",
        MIN_FUNCTION {
            if (inlet == 1) {
                p = static_cast<double>(args[0].a_w.w_long);
            }
            return {};
        }
    };

    message<> seed_msg {this, "seed", "Set seed value",
        MIN_FUNCTION {
            seed_value = static_cast<unsigned long>(args[0]);
            m_generator.seed(seed_value);
            return {};
        }
    };

    message<> info {this, "info", "Output current state",
        MIN_FUNCTION {
            cout << "state:" << endl;
            cout << "  p: " << p << endl;
            cout << "  seed: " << seed_value << endl;
            return {};
        }
    };

private:
    void generate_random_value() {
        std::bernoulli_distribution dist(p);
        bernoulli_result = dist(m_generator);
        output.send(bernoulli_result);
    }

    std::mt19937 m_generator;
    double p {0.5};  // Probability parameter
    int bernoulli_result {0};
    unsigned long seed_value {std::random_device{}()};
};

MIN_EXTERNAL(alea_bernoulli);
