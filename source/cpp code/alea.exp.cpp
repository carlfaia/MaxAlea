#include "c74_min.h"
#include <random>

using namespace c74::min;

class alea_exp : public object<alea_exp> {
public:
    MIN_DESCRIPTION {"Generates a random number with exponential distribution"};
    MIN_TAGS {"random, exponential"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random"};

    inlet<> input {this, "(bang) Generate random value"};
    inlet<> lambda_inlet {this, "(float) Set lambda value"};
    outlet<> output {this, "(float) Output random value"};

    alea_exp(const atoms& args = {}) {
        if (!args.empty() && args[0].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
            set_lambda(args[0]);
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
                set_lambda(args[0]);
            }
            return {};
        }
    };

    message<> seed {this, "seed", "Set seed value",
        MIN_FUNCTION {
            if (args.size() > 0 && args[0].a_type == c74::max::e_max_atomtypes::A_LONG) {
                seed_value = static_cast<unsigned long>(args[0]);
                m_generator.seed(seed_value);
            }
            return {};
        }
    };

    message<> info {this, "info", "Get object info",
        MIN_FUNCTION {
            cout << "alea-exp: seed = " << seed_value << endl;
            cout << "alea-exp: lambda = " << exp_lambda << endl;
            cout << "alea-exp: last generated value = " << last_value << endl;
            return {};
        }
    };

private:
    void generate_random_value() {
        std::exponential_distribution<> distribution(exp_lambda);
        last_value = distribution(m_generator);
        output.send(last_value);
    }

    void set_lambda(double lambda) {
        if (lambda == 0.0) {
            cerr << "Error: lambda cannot be 0. Setting lambda to default value 1.0." << endl;
            exp_lambda = 1.0;
        } else {
            exp_lambda = lambda;
        }
    }

    std::mt19937 m_generator;
    double exp_lambda {1.0};
    double last_value {0.0};
    unsigned long seed_value {0};
};

MIN_EXTERNAL(alea_exp);
