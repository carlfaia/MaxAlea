#include "c74_min.h"
#include <random>
#include <cmath>

using namespace c74::min;

class alea_circ : public object<alea_circ> {
public:
    MIN_DESCRIPTION {"Generates random values based on a circular distribution"};
    MIN_TAGS {"random, distribution, circle"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random"};

    inlet<> input {this, "(bang) Generate random value"};
    inlet<> mean_inlet {this, "(float) Set mean value"};
    inlet<> arc_inlet {this, "(float) Set arc value"};
    outlet<> output {this, "(float) Output random value"};

    alea_circ(const atoms& args = {}) {
        if (args.size() > 0 && args[0].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
            mean = args[0];
        }
        if (args.size() > 1 && args[1].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
            arc = args[1];
        }

        generator.seed(std::random_device{}());
    }

    message<> bang {this, "bang", "Generate random value",
        MIN_FUNCTION {
            generate_random_value();
            return {};
        }
    };

    message<> float_msg {this, "float", "Set mean or arc value",
        MIN_FUNCTION {
            if (inlet == 1) {
                mean = args[0];
            }
            else if (inlet == 2) {
                arc = args[0];
            }
            return {};
        }
    };

    message<> int_msg {this, "int", "Set seed value",
        MIN_FUNCTION {
            if (inlet == 3) {
                seed = args[0];
                generator.seed(seed);
            }
            return {};
        }
    };

    message<> seed_msg {this, "seed", "Set seed value",
        MIN_FUNCTION {
            seed = args[0];
            generator.seed(seed);
            return {};
        }
    };

    message<> info {this, "info", "Output current state",
        MIN_FUNCTION {
            cout << "alea_circ state:" << endl;
            cout << "  mean: " << mean << endl;
            cout << "  arc: " << arc << endl;
            cout << "  seed: " << seed << endl;
            return {};
        }
    };

private:
    void generate_random_value() {
        std::uniform_real_distribution<double> dist(0.0, 1.0);
        double random_value = dist(generator);

        double g = (mean + arc * (random_value - 0.5));
        double n = g / 3;
        n = n * pi;
        n = g - n;

        double result = n;
        output.send(result);
    }

    std::mt19937 generator;
    double mean = 0.0;
    double arc = 1.0;
    unsigned long seed = std::random_device{}();
    const double pi = 3.141592653589793238462643383279502884;
};

MIN_EXTERNAL(alea_circ);
