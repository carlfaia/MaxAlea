#include "c74_min.h"
#include <random>

using namespace c74::min;

class alea_weibull : public object<alea_weibull> {
public:
    MIN_DESCRIPTION {"Generates random values from a Weibull distribution"};
    MIN_TAGS {"random, distribution"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random"};

    inlet<> input {this, "(bang) Generate random value"};
    inlet<> scale_inlet {this, "(float) Set scale parameter"};
    inlet<> shape_inlet {this, "(float) Set shape parameter"};
    outlet<> output {this, "(float) Output random value"};

    alea_weibull(const atoms& args = {}) {
        if (args.size() > 0) {
            if (args[0].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                scale = args[0];
            }
            else if (args[0].a_type == c74::max::e_max_atomtypes::A_LONG) {
                scale = static_cast<double>(args[0].a_w.w_long);
            }
        }
        if (args.size() > 1) {
            if (args[1].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                shape = args[1];
            }
            else if (args[1].a_type == c74::max::e_max_atomtypes::A_LONG) {
                shape = static_cast<double>(args[1].a_w.w_long);
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

    message<> float_msg {this, "float", "Set scale or shape parameter",
        MIN_FUNCTION {
            if (inlet == 1) {
                scale = args[0];
            }
            else if (inlet == 2) {
                shape = args[0];
            }
            return {};
        }
    };

    message<> int_msg {this, "int", "Set scale or shape parameter",
        MIN_FUNCTION {
            if (inlet == 1) {
                scale = static_cast<double>(args[0].a_w.w_long);
            }
            else if (inlet == 2) {
                shape = static_cast<double>(args[0].a_w.w_long);
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
            cout << "alea_weibull state:" << endl;
            cout << "  scale: " << scale << endl;
            cout << "  shape: " << shape << endl;
            cout << "  seed: " << seed_value << endl;
            return {};
        }
    };

private:
    void generate_random_value() {
        std::uniform_real_distribution<double> dist(0.0, 1.0);
        double U = dist(m_generator);
        double weibull_result = scale * pow(-log(1.0 - U), 1.0 / shape);
        output.send(weibull_result);
    }

    std::mt19937 m_generator;
    double scale {1.0};  // Scale parameter
    double shape {3.2}; // Shape parameter
    double weibull_result {0.0};
    unsigned long seed_value {std::random_device{}()};
};

MIN_EXTERNAL(alea_weibull);
