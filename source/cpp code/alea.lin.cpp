#include "c74_min.h"
#include <random>
#include <cmath>

using namespace c74::min;

class alea_lin : public object<alea_lin> {
public:
    MIN_DESCRIPTION {"Generates random values with a linear distribution"};
    MIN_TAGS {"random, linear"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random"};

    inlet<> input {this, "(bang) Generate random value"};
    inlet<> lambda_inlet {this, "(float/int) Set lambda value"};
    outlet<> output {this, "(float) Output random value"};

    alea_lin(const atoms& args = {}) {
        if (args.size() > 0) {
            if (args[0].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                lin_lambda = args[0];
                type = 0;
            }
            else if (args[0].a_type == c74::max::e_max_atomtypes::A_LONG) {
                lin_lambda = static_cast<double>(args[0].a_w.w_long);
                type = 1;
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

    message<> float_msg {this, "float", "Set lambda value",
        MIN_FUNCTION {
            if (inlet == 1) {
                lin_lambda = args[0];
            }
            return {};
        }
    };

    message<> int_msg {this, "int", "Set lambda value",
        MIN_FUNCTION {
            if (inlet == 1) {
                lin_lambda = static_cast<double>(args[0].a_w.w_long);
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
            cout << "alea_lin state:" << endl;
            cout << "  lambda: " << lin_lambda << endl;
            cout << "  seed: " << seed_value << endl;
            return {};
        }
    };

private:
    void generate_random_value() {
        std::uniform_real_distribution<double> dist(0.0, 1.0);
        double random_value = dist(m_generator);

        // Linear distribution transformation
        double n = lin_lambda * (1 - sqrt(random_value));
        if (type == 1) {
            lin_result = static_cast<long>(n + 0.5);
            output.send(static_cast<long>(lin_result));
        } else {
            lin_result = n;
            output.send(lin_result);
        }
    }

    std::mt19937 m_generator;
    double lin_lambda {10.0};
    double lin_result {0.0};
    unsigned long seed_value {std::random_device{}()};
    int type {0};
};

MIN_EXTERNAL(alea_lin);
