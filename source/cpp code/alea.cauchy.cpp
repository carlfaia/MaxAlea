#include "c74_min.h"
#include <cmath>
#include <random>
#include <array>

using namespace c74::min;

class alea_cauchy : public object<alea_cauchy> {
public:
    MIN_DESCRIPTION {"Generates a Cauchy-distributed random variable"};
    MIN_TAGS {"random, cauchy"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random, distribution"};

    inlet<> input_bang {this, "(bang) Generate random number"};
    inlet<> input_alpha {this, "(float) Alpha value"};
    outlet<> output {this, "(float/int) Cauchy-distributed random number"};

    alea_cauchy(const atoms& args = {}) {
        if (args.size() >= 1) {
            m_alpha = static_cast<double>(args[0]);
        }
        if (args.size() > 1) {
            set_seed(static_cast<uint32_t>(static_cast<int>(args[1])));
        } else {
            set_seed(static_cast<uint32_t>(std::random_device{}()));
        }
    }

    message<> bang {this, "bang", "Generate and output a Cauchy-distributed random number",
        MIN_FUNCTION {
            generate_random();
            return {};
        }
    };

    message<> float_input {this, "float", "Set alpha value",
        MIN_FUNCTION {
            m_alpha = args[0];
            return {};
        }
    };

    message<> int_input {this, "int", "Set alpha value",
        MIN_FUNCTION {
            m_alpha = static_cast<double>(args[0]);
            return {};
        }
    };

    message<> seed {this, "seed", "Set the random seed",
        MIN_FUNCTION {
            if (!args.empty()) {
                set_seed(static_cast<uint32_t>(static_cast<int>(args[0])));
            }
            return {};
        }
    };

    message<> info {this, "info", "Print current state information",
        MIN_FUNCTION {
            cout << "Alpha: " << m_alpha << endl;
            cout << "Seed: " << m_seed << endl;
            cout << "Last value: " << m_last_value << endl;
            cout << "Count: " << m_count << endl;
            return {};
        }
    };

private:
    std::mt19937 m_gen;
    uint32_t m_seed;
    long m_count{0};
    double m_last_value{0.0};
    double m_alpha{1.0};

    void set_seed(uint32_t s) {
        if (m_seed != s) {
            m_seed = s;
            m_gen.seed(s);
            m_count = 0;
        }
    }

    void generate_random() {
        m_count++;
        double temp;
        double g = m_alpha;
        const double pi = 3.141592653589793238462643;

        if (g == 0) {
            error("alea-cauchy : alpha = 0");
            g = 0.00000001;
        }

        double u = std::generate_canonical<double, 32>(m_gen) * pi;
        double n = g * std::tan(u);

        m_last_value = n;
        output.send(n);
    }
};

MIN_EXTERNAL(alea_cauchy);
