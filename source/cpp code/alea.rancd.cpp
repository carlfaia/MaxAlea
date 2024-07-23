#include "c74_min.h"
#include <random>
#include <array>

using namespace c74::min;

class alea_rancd : public object<alea_rancd> {
public:
    MIN_DESCRIPTION {"Generates a random number between C and D"};
    MIN_TAGS {"random"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random"};

    inlet<> input_bang {this, "(bang) Generate random number"};
    inlet<> input_low {this, "(float/int) Low limit (C)"};
    inlet<> input_high {this, "(float/int) High limit + 1 (D)"};
    outlet<> output {this, "(float/int) Scaled between C and D-1"};

    alea_rancd(const atoms& args = {}) {
        if (args.size() >= 2) {
            m_low1 = static_cast<double>(args[0]);
            m_high2 = static_cast<double>(args[1]);
        }
        if (args.size() > 2) {
            set_seed(static_cast<uint32_t>(static_cast<int>(args[2])));
        } else {
            set_seed(static_cast<uint32_t>(std::random_device{}()));
        }
    }

    message<> bang {this, "bang", "Generate and output a random number",
        MIN_FUNCTION {
            generate_random();
            return {};
        }
    };

    message<> float_input {this, "float", "Set low1 (C) or high2 (D) value",
        MIN_FUNCTION {
            if (inlet == 1) {
                m_low1 = args[0];
            } else if (inlet == 2) {
                m_high2 = args[0];
            }
            return {};
        }
    };

    message<> int_input {this, "int", "Set low1 (C) or high2 (D) value",
        MIN_FUNCTION {
            if (inlet == 1) {
                m_low1 = static_cast<double>(args[0]);
            } else if (inlet == 2) {
                m_high2 = static_cast<double>(args[0]);
            }
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

    message<> mode {this, "mode", "Set the output mode (0: float, 1: int)",
        MIN_FUNCTION {
            if (!args.empty()) {
                m_outtype = (args[0] == 1);
            }
            return {};
        }
    };

    message<> info {this, "info", "Print current state information",
        MIN_FUNCTION {
            cout << "Mode: " << (m_outtype ? "int" : "float") << endl;
            cout << "Count: " << m_count << endl;
            cout << "Seed: " << m_seed << endl;
            cout << "Last value: " << m_last_value << endl;
            cout << "Low limit (C): " << m_low1 << endl;
            cout << "High limit (D): " << m_high2 << endl;
            return {};
        }
    };

private:
    std::mt19937 m_gen;
    uint32_t m_seed;
    long m_count{0};
    double m_last_value{0.0};
    double m_low1{0.0};
    double m_high2{1.0};
    bool m_outtype{false};

    void set_seed(uint32_t s) {
        if (m_seed != s) {
            m_seed = s;
            m_gen.seed(s);
            m_count = 0;
        }
    }

    void generate_random() {
        m_count++;
        double rand_val = std::uniform_real_distribution<>(0.0, 1.0)(m_gen);
        double scaled_value = m_low1 + (rand_val * (m_high2 - m_low1));
        m_last_value = scaled_value;

        if (m_outtype) {
            output.send(static_cast<int>(std::round(scaled_value)));
        } else {
            output.send(scaled_value);
        }
    }
};

MIN_EXTERNAL(alea_rancd);
