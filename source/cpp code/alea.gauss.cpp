#include "c74_min.h"
#include <random>

using namespace c74::min;

class alea_gauss : public object<alea_gauss> {
public:
    MIN_DESCRIPTION {"Generates a random number with a Gaussian (normal) distribution"};
    MIN_TAGS {"random, Gaussian, normal"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random"};

    inlet<> input {this, "(bang) Generate random value"};
    inlet<> sigma_inlet {this, "(float) Set sigma value"};
    inlet<> mu_inlet {this, "(float) Set mu value"};
    outlet<> output {this, "(float) Output random value"};

    alea_gauss(const atoms& args = {}) {
        if (args.size() > 0 && args[0].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
            sigma = args[0];
        }
        if (args.size() > 1 && args[1].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
            mu = args[1];
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

    message<> float_msg {this, "float", "Set sigma or mu value",
        MIN_FUNCTION {
            if (inlet == 1) {
                set_sigma(args[0]);
            }
            else if (inlet == 2) {
                set_mu(args[0]);
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
            cout << "alea-gauss: seed = " << seed_value << endl;
            cout << "alea-gauss: sigma = " << sigma << endl;
            cout << "alea-gauss: mu = " << mu << endl;
            cout << "alea-gauss: last generated value = " << last_value << endl;
            return {};
        }
    };

private:
    void generate_random_value() {
        std::normal_distribution<> distribution(mu, sigma);
        last_value = distribution(m_generator);
        output.send(last_value);
    }

    void set_sigma(double value) {
        if (value <= 0.0) {
            cerr << "Error: sigma must be greater than 0. Setting sigma to default value 0.7." << endl;
            sigma = 0.7;
        } else {
            sigma = value;
        }
    }

    void set_mu(double value) {
        mu = value;
    }

    std::mt19937 m_generator;
    double sigma {0.7};
    double mu {0.9};
    double last_value {0.0};
    unsigned long seed_value {0};
};

MIN_EXTERNAL(alea_gauss);
