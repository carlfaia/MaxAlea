#include "c74_min.h"
#include <random>
#include <cmath>

using namespace c74::min;

class alea_interval : public object<alea_interval> {
public:
    MIN_DESCRIPTION {"Generates random values within a specified interval"};
    MIN_TAGS {"random, interval"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random"};

    inlet<> input {this, "(bang) Generate random value"};
    inlet<> start_inlet {this, "(float/int) Set start value"};
    inlet<> interval_inlet {this, "(float/int) Set interval value"};
    outlet<> output {this, "(float) Output random value"};

    alea_interval(const atoms& args = {}) {
        if (args.size() > 0) {
            if (args[0].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                interval_a = args[0];
                type = 0;
            }
            else if (args[0].a_type == c74::max::e_max_atomtypes::A_LONG) {
                interval_a = static_cast<double>(args[0].a_w.w_long);
                type = 1;
            }
        }
        if (args.size() > 1) {
            if (args[1].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                interval_b = args[1];
            }
            else if (args[1].a_type == c74::max::e_max_atomtypes::A_LONG) {
                interval_b = static_cast<double>(args[1].a_w.w_long);
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

    message<> float_msg {this, "float", "Set start or interval value",
        MIN_FUNCTION {
            if (inlet == 1) {
                interval_a = args[0];
                type = 0;
            }
            else if (inlet == 2) {
                interval_b = args[0];
            }
            return {};
        }
    };

    message<> int_msg {this, "int", "Set start or interval value",
        MIN_FUNCTION {
            if (inlet == 1) {
                interval_a = static_cast<double>(args[0].a_w.w_long);
                type = 1;
            }
            else if (inlet == 2) {
                interval_b = static_cast<double>(args[0].a_w.w_long);
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
            cout << "alea_interval state:" << endl;
            cout << "  start (a): " << interval_a << endl;
            cout << "  interval (b): " << interval_b << endl;
            cout << "  seed: " << seed_value << endl;
            return {};
        }
    };

private:
    void generate_random_value() {
        std::uniform_real_distribution<double> dist(0.0, 1.0);
        double random_value = dist(m_generator);

        double n = interval_a + (interval_b - (random_value * ((2 * interval_b) + 0)));
        if (type == 1) {
            interval_result = custom_round(n);
            output.send(static_cast<long>(interval_result));
        } else {
            interval_result = n;
            output.send(interval_result);
        }
    }

    long custom_round(double value) {
        return static_cast<long>(value > 0.0 ? value + 0.5 : value - 0.5);
    }

    std::mt19937 m_generator;
    double interval_a {60};
    double interval_b {2};
    double interval_result {0.0};
    unsigned long seed_value {std::random_device{}()};
    int type {0};
};

MIN_EXTERNAL(alea_interval);
