#include "c74_min.h"
#include <random>

using namespace c74::min;

class alea_pareto : public object<alea_pareto> {
public:
    MIN_DESCRIPTION {"Generates random values based on a Pareto distribution"};
    MIN_TAGS {"random, distribution, pareto"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random"};

    inlet<> input {this, "(bang) Generate random value"};
    inlet<> shape_inlet {this, "(float) Set shape (alpha) value"};
    inlet<> scale_inlet {this, "(float) Set scale (beta) value"};
    outlet<> output {this, "(float) Output random value"};

    alea_pareto(const atoms& args = {}) {
        if (args.size() > 0 && args[0].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
            pareto_a = args[0];
        }
        if (args.size() > 1 && args[1].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
            pareto_b = args[1];
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

    message<> float_msg {this, "float", "Set shape or scale value",
        MIN_FUNCTION {
            if (inlet == 1) {
                pareto_a = args[0];
            }
            else if (inlet == 2) {
                pareto_b = args[0];
            }
            return {};
        }
    };

    message<> int_msg {this, "int", "Set shape or scale value",
        MIN_FUNCTION {
            if (inlet == 1) {
                pareto_a = static_cast<double>(args[0]);
            }
            else if (inlet == 2) {
                pareto_b = static_cast<double>(args[0]);
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
            cout << "alea_pareto state:" << endl;
            cout << "  shape (alpha): " << pareto_a << endl;
            cout << "  scale (beta): " << pareto_b << endl;
            cout << "  seed: " << seed_value << endl;
            return {};
        }
    };

private:
    void generate_random_value() {
        std::uniform_real_distribution<double> dist(0.0, 1.0);
        double random_value = dist(m_generator);

        double n = pareto_b / pow(random_value, 1.0 / pareto_a);
        if (type == 1) {
            pareto_result = static_cast<long>(n + 0.5);
            output.send(static_cast<long>(pareto_result));
        } else {
            pareto_result = n;
            output.send(pareto_result);
        }
    }

    std::mt19937 m_generator;
    double pareto_a {1.0};
    double pareto_b {1.0};
    double pareto_result {0.0};
    unsigned long seed_value {std::random_device{}()};
    int type {0};
};

MIN_EXTERNAL(alea_pareto);
