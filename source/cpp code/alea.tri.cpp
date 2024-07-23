#include "c74_min.h"
#include <random>

using namespace c74::min;

class alea_triang : public object<alea_triang> {
public:
    MIN_DESCRIPTION {"Generates random values following a triangular distribution"};
    MIN_TAGS {"random, distribution"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random"};

    inlet<> input {this, "(bang) Generate random value"};
    inlet<> a_inlet {this, "(float/int) Set minimum value (a)"};
    inlet<> b_inlet {this, "(float/int) Set maximum value (b)"};
    inlet<> c_inlet {this, "(float/int) Set mode value (c)"};
    outlet<> output {this, "(float) Output random value"};

    alea_triang(const atoms& args = {}) {
        if (args.size() > 0) {
            if (args[0].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                triang_a = args[0];
            }
            else if (args[0].a_type == c74::max::e_max_atomtypes::A_LONG) {
                triang_a = static_cast<double>(args[0].a_w.w_long);
            }
        }
        if (args.size() > 1) {
            if (args[1].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                triang_b = args[1];
            }
            else if (args[1].a_type == c74::max::e_max_atomtypes::A_LONG) {
                triang_b = static_cast<double>(args[1].a_w.w_long);
            }
        }
        if (args.size() > 2) {
            if (args[2].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                triang_c = args[2];
            }
            else if (args[2].a_type == c74::max::e_max_atomtypes::A_LONG) {
                triang_c = static_cast<double>(args[2].a_w.w_long);
            }
        }

        validate_parameters();

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

    message<> float_msg {this, "float", "Set minimum, maximum, or mode value",
        MIN_FUNCTION {
            if (inlet == 1) {
                triang_a = args[0];
            }
            else if (inlet == 2) {
                triang_b = args[0];
            }
            else if (inlet == 3) {
                triang_c = args[0];
            }
            validate_parameters();
            return {};
        }
    };

    message<> int_msg {this, "int", "Set minimum, maximum, or mode value",
        MIN_FUNCTION {
            if (inlet == 1) {
                triang_a = static_cast<double>(args[0].a_w.w_long);
            }
            else if (inlet == 2) {
                triang_b = static_cast<double>(args[0].a_w.w_long);
            }
            else if (inlet == 3) {
                triang_c = static_cast<double>(args[0].a_w.w_long);
            }
            validate_parameters();
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
            cout << "alea_triang state:" << endl;
            cout << "  minimum (a): " << triang_a << endl;
            cout << "  maximum (b): " << triang_b << endl;
            cout << "  mode (c): " << triang_c << endl;
            cout << "  seed: " << seed_value << endl;
            return {};
        }
    };

private:
    void generate_random_value() {
        std::uniform_real_distribution<double> dist(0.0, 1.0);
        double u = dist(m_generator);

        if (u < (triang_c - triang_a) / (triang_b - triang_a)) {
            triang_result = triang_a + sqrt(u * (triang_b - triang_a) * (triang_c - triang_a));
        } else {
            triang_result = triang_b - sqrt((1 - u) * (triang_b - triang_a) * (triang_b - triang_c));
        }

        output.send(triang_result);
    }

    void validate_parameters() {
        if (triang_c < triang_a || triang_c > triang_b) {
            cerr << "Mode value (c) must be between minimum (a) and maximum (b)" << endl;
            triang_c = (triang_a + triang_b) / 2; // Default to midpoint if invalid
        }
    }

    std::mt19937 m_generator;
    double triang_a {0.0};
    double triang_b {1.0};
    double triang_c {0.5}; // Default mode is the midpoint of a and b
    double triang_result {0.0};
    unsigned long seed_value {std::random_device{}()};
};

MIN_EXTERNAL(alea_triang);
