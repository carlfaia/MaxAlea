#include "c74_min.h"
#include <random>
#include <array>

using namespace c74::min;

class alea_oneoverf : public object<alea_oneoverf> {
public:
    MIN_DESCRIPTION {"Generates 1/f noise using a simple algorithm based on Clarke and Voss"};
    MIN_TAGS {"random, noise"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"noise, random"};

    inlet<> input {this, "(bang) Generate 1/f noise"};
    inlet<> start_value {this, "(float) Start value", "float"};
    inlet<> nop_value {this, "(float) Number of possible results", "float"};
    outlet<> noise_out {this, "(float) 1/f noise output"};

    alea_oneoverf(const atoms& args = {}) {
        if (!args.empty() && (args[0] == 0 || args[0] == 1)) {
            m_mode = static_cast<int>(args[0]);
        } else {
            m_mode = 0; // Default to float output
        }
        std::random_device rd;
        uint32_t random_seed = rd();
        set_seed(random_seed);
    }

    message<> bang {this, "bang", "Generate and output a random number",
        MIN_FUNCTION {
            generate_noise();
            return {};
        }
    };

    message<> set_float {this, "float", "Set start or nop value",
        MIN_FUNCTION {
            if (inlet == 1) {
                m_start = args[0];
            } else if (inlet == 2) {
                m_nop = args[0];
            }
            return {};
        }
    };

    message<> mode {this, "mode", "Set the output mode (0 for float, 1 for int)",
        MIN_FUNCTION {
            if (!args.empty()) {
                m_mode = static_cast<int>(static_cast<double>(args[0]));
            }
            return {};
        }
    };

    message<> seed {this, "seed", "Set the random seed",
        MIN_FUNCTION {
            if (!args.empty()) {
                double seed_value = args[0];
                set_seed(static_cast<uint32_t>(seed_value));
            }
            return {};
        }
    };

    message<> info {this, "info", "Print current state information",
        MIN_FUNCTION {
            cout << "Mode: " << m_mode << endl;
            cout << "Last result: " << m_result << endl;
            cout << "Seed: " << m_seed << endl;
            return {};
        }
    };

    message<> reset {this, "reset", "Reset to default start and nop values",
        MIN_FUNCTION {
            m_nop = 32;
            m_start = 0;
            cout << "Reset to Start: 0, NOP: 32" << endl;
            return {};
        }
    };

private:
    uint32_t m_seed;
    int m_mode = 0;
    double m_start = 0;
    double m_nop = 128;
    double m_result = 0;
    std::mt19937 m_gen;

    void set_seed(uint32_t s) {
        m_seed = s;
        m_gen.seed(s);
    }

    void generate_noise() {
        double n = m_nop;
        double last = m_start;
        double neww = 0;
        double k = static_cast<int>(n / 2);
        double probit = 1.0 / n;

        while (k >= 1) {
            int temp = static_cast<int>(last / k);
            if (temp == 1) {
                last -= k;
            }
            if (std::generate_canonical<double, 32>(m_gen) < probit) {
                temp = 1 - temp;
            }
            neww += temp * k;
            k = static_cast<int>(k / 2);
            probit *= 2.0;
        }

        m_result = neww;
        if (m_mode == 1) {
            noise_out.send(static_cast<int>(m_result));
        } else {
            noise_out.send(m_result);
        }
    }
};

MIN_EXTERNAL(alea_oneoverf);
