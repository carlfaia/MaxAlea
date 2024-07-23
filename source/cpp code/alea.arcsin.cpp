#include "c74_min.h"
#include <random>
#include <array>

using namespace c74::min;

class alea_arcsin : public object<alea_arcsin> {
public:
    MIN_DESCRIPTION {"Generates random numbers using arcsin distribution"};
    MIN_TAGS {"random, stochastic"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random"};

    inlet<> input {this, "(bang/float/int) generate arcsin random number"};
    inlet<> alpha_inlet {this, "(float/int) alpha value", "alpha"};
    inlet<> beta_inlet {this, "(float/int) beta value", "beta"};
    outlet<> output {this, "(float/int) random number"};

    alea_arcsin(const atoms& args = {})
        : m_mode(0), m_input(0), m_type(0), m_arcsin_count(0),
          m_alpha(args.size() > 0 ? static_cast<double>(args[0]) : 1.0),
          m_beta(args.size() > 1 ? static_cast<double>(args[1]) : 0.0) {

        std::random_device rd;
        set_seed(rd());
    }

    message<> bang {this, "bang", "Generate and output a random number",
        MIN_FUNCTION {
            generate_random_number();
            return {};
        }
    };

    message<> float_message {this, "float", "Generate number or set alpha/beta",
        MIN_FUNCTION {
            if (inlet == 0) {
                m_input_value = args[0];
                m_type = 0;
                generate_random_number();
            } else if (inlet == 1) {
                m_alpha = args[0];
            } else if (inlet == 2) {
                m_beta = args[0];
            }
            return {};
        }
    };

    message<> int_message {this, "int", "Generate number or set alpha/beta",
        MIN_FUNCTION {
            if (inlet == 0) {
                m_input_value = static_cast<double>(args[0]);
                m_type = 1;
                generate_random_number();
            } else if (inlet == 1) {
                m_alpha = args[0];
            } else if (inlet == 2) {
                m_beta = args[0];
            }
            return {};
        }
    };

    message<> mode {this, "mode", "Set the output mode (0=float, 1=int)",
        MIN_FUNCTION {
            if (!args.empty()) {
                m_mode = std::clamp(static_cast<int>(args[0]), 0, 1);
                cout << "Mode set to: " << m_mode << endl;
            }
            return {};
        }
    };

    message<> seed {this, "seed", "Set the random seed",
        MIN_FUNCTION {
            if (!args.empty()) {
                set_seed(static_cast<uint32_t>(static_cast<int>(args[0])));
                cout << "Seed set to: " << m_seed << endl;
            }
            return {};
        }
    };

    message<> input_mode {this, "input", "Set input mode",
        MIN_FUNCTION {
            if (!args.empty()) {
                m_input = args[0];
                cout << "Input mode set to: " << m_input << endl;
            }
            return {};
        }
    };

    message<> info {this, "info", "Print current state information",
        MIN_FUNCTION {
            cout << "Alpha: " << m_alpha << endl;
            cout << "Beta: " << m_beta << endl;
            cout << "Seed: " << m_seed << endl;
            cout << "Mode: " << m_mode << endl;
            cout << "Input mode: " << m_input << endl;
            cout << "Iteration: " << m_arcsin_count << endl;
            return {};
        }
    };

private:
    std::mt19937 m_gen;
    uint32_t m_seed;
    int m_mode;
    int m_input;
    int m_type;
    long m_arcsin_count;
    double m_alpha;
    double m_beta;
    double m_rand;
    double m_result;
    double m_input_value;

    void set_seed(uint32_t s) {
        m_seed = s;
        m_gen.seed(s);
        m_arcsin_count = 0;
    }

    void generate_random_number() {
        m_arcsin_count++;
        double temp = 0.0;

        if (m_input == 1) {
            long m = static_cast<long>(m_input_value * 2147483647);
            m = (m * 1103515245 + 12345) & 2147483647;
            temp = (static_cast<double>(m) + 0.5) / 2147483648.0;
        } else {
            std::uniform_real_distribution<> dis(0.0, 1.0);
            temp = dis(m_gen);
        }

        double g = std::sin(3.141592653589793238462643 * temp) / 2.0;
        double n = (g * g * m_alpha) + m_beta;

        if (m_mode == 1) {
            n = std::round(n);
            output.send(static_cast<long>(n));
        } else {
            output.send(n);
        }
    }
};

MIN_EXTERNAL(alea_arcsin);
