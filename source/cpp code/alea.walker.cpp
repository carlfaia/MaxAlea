#include "c74_min.h"
#include <random>

using namespace c74::min;

class alea_walker : public object<alea_walker> {
public:
    MIN_DESCRIPTION {"Simulates a random walk with boundaries and directional bias"};
    MIN_TAGS {"random, walk"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random"};

    inlet<> input {this, "(bang) Generate random value"};
    inlet<> start_inlet {this, "(float) Set start value"};
    inlet<> maxstep_inlet {this, "(float) Set max step value"};
    inlet<> low_inlet {this, "(float) Set low boundary"};
    inlet<> high_inlet {this, "(float) Set high boundary"};
    inlet<> weight_inlet {this, "(float) Set weight value"};
    outlet<> output {this, "(float) Output random value"};

    alea_walker(const atoms& args = {}) {
        if (args.size() > 0) {
            if (args[0].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                walker_start = args[0];
            }
            else if (args[0].a_type == c74::max::e_max_atomtypes::A_LONG) {
                walker_start = static_cast<double>(args[0].a_w.w_long);
            }
        }
        if (args.size() > 1) {
            if (args[1].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                walker_maxstep = args[1];
            }
            else if (args[1].a_type == c74::max::e_max_atomtypes::A_LONG) {
                walker_maxstep = static_cast<double>(args[1].a_w.w_long);
            }
        }
        if (args.size() > 2) {
            if (args[2].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                walker_low = args[2];
            }
            else if (args[2].a_type == c74::max::e_max_atomtypes::A_LONG) {
                walker_low = static_cast<double>(args[2].a_w.w_long);
            }
        }
        if (args.size() > 3) {
            if (args[3].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                walker_high = args[3];
            }
            else if (args[3].a_type == c74::max::e_max_atomtypes::A_LONG) {
                walker_high = static_cast<double>(args[3].a_w.w_long);
            }
        }
        if (args.size() > 4) {
            if (args[4].a_type == c74::max::e_max_atomtypes::A_FLOAT) {
                walker_weight = args[4];
            }
            else if (args[4].a_type == c74::max::e_max_atomtypes::A_LONG) {
                walker_weight = static_cast<double>(args[4].a_w.w_long);
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

    message<> float_msg {this, "float", "Set start, maxstep, low, high, or weight value",
        MIN_FUNCTION {
            if (inlet == 1) {
                walker_start = args[0];
            }
            else if (inlet == 2) {
                walker_maxstep = args[0];
            }
            else if (inlet == 3) {
                walker_low = args[0];
            }
            else if (inlet == 4) {
                walker_high = args[0];
            }
            else if (inlet == 5) {
                walker_weight = args[0];
            }
            return {};
        }
    };

    message<> int_msg {this, "int", "Set start, maxstep, low, high, or weight value",
        MIN_FUNCTION {
            if (inlet == 1) {
                walker_start = static_cast<double>(args[0].a_w.w_long);
            }
            else if (inlet == 2) {
                walker_maxstep = static_cast<double>(args[0].a_w.w_long);
            }
            else if (inlet == 3) {
                walker_low = static_cast<double>(args[0].a_w.w_long);
            }
            else if (inlet == 4) {
                walker_high = static_cast<double>(args[0].a_w.w_long);
            }
            else if (inlet == 5) {
                walker_weight = static_cast<double>(args[0].a_w.w_long);
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
            cout << "alea_walker state:" << endl;
            cout << "  start: " << walker_start << endl;
            cout << "  maxstep: " << walker_maxstep << endl;
            cout << "  low: " << walker_low << endl;
            cout << "  high: " << walker_high << endl;
            cout << "  weight: " << walker_weight << endl;
            cout << "  seed: " << seed_value << endl;
            return {};
        }
    };

private:
    void generate_random_value() {
        std::uniform_real_distribution<double> dist(0.0, 1.0);
        
        double temp = dist(m_generator);
        double temp2 = dist(m_generator);
        
        if (temp2 > walker_weight)
            temp = (temp * walker_maxstep) * -1.0;
        else
            temp = (temp * walker_maxstep);
        
        double n = walker_start + temp;
        
        if (n > walker_high)
            n = (walker_high * 2.0) - n;
        else if (n < walker_low)
            n = (walker_low * 2.0) - n;
        
        walker_start = n;
        
        output.send(n);
    }

    std::mt19937 m_generator;
    double walker_start {60.0};
    double walker_maxstep {2.0};
    double walker_low {24.0};
    double walker_high {100.0};
    double walker_weight {0.5};
    unsigned long seed_value {std::random_device{}()};
};

MIN_EXTERNAL(alea_walker);
