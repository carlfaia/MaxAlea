#include "c74_min.h"

using namespace c74::min;

class alea_mapper_class : public object<alea_mapper_class> {
public:
    MIN_DESCRIPTION {"Maps input values to output range"};
    MIN_TAGS {"mapping"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"scale"};

    // Define inlets
    inlet<> input_number {this, "(float/int) Input number to be mapped"};
    inlet<> low_input {this, "(float/int) Low input limit"};
    inlet<> high_input {this, "(float/int) High input limit"};
    inlet<> low_output {this, "(float/int) Low output limit"};
    inlet<> high_output {this, "(float/int) High output limit"};

    // Define outlets
    outlet<> mapped_output {this, "(float/int) Mapped output"};
    outlet<> below_low {this, "(float/int) Input below low input limit"};
    outlet<> above_high {this, "(float/int) Input above high input limit"};

    // Constructor
    alea_mapper_class(const atoms& args = {}) {
        // Initialize with default values or from arguments
        if (args.size() >= 4) {
            m_low_input = args[0];
            m_high_input = args[1];
            m_low_output = args[2];
            m_high_output = args[3];
        }
        update_output_type();
    }

    // Message handler for setting scale mode
    message<> scale_mode {this, "scalemode", "Set scale mode (0 or 1)",
        MIN_FUNCTION {
            if (args.size() > 0) {
                m_scale_mode = (static_cast<int>(args[0]) != 0);
                cout << "Scale mode set to: " << (m_scale_mode ? "On" : "Off") << endl;
            }
            return {};
        }
    };

    // Handle number input (float or int) on any inlet
    message<> number {this, "number", "Map input number or set parameter",
        MIN_FUNCTION {
            double input = args[0];
            bool is_float = (args[0].a_type == c74::max::A_FLOAT);

            switch (inlet) {
                case 0:
                    map_number(input, is_float);
                    break;
                case 1:
                    m_low_input = input;
                    update_output_type();
                    break;
                case 2:
                    m_high_input = input;
                    update_output_type();
                    break;
                case 3:
                    m_low_output = input;
                    update_output_type();
                    break;
                case 4:
                    m_high_output = input;
                    update_output_type();
                    break;
            }
            return {};
        }
    };

private:
    // Member variables to store mapping parameters
    double m_low_input = 0.0;
    double m_high_input = 1.0;
    double m_low_output = 0.0;
    double m_high_output = 127.0;
    bool m_output_type_int = true;  // Start with integer output by default
    bool m_scale_mode = false;  // false for normal mode, true for scale-only mode

    // Perform the actual mapping
    void map_number(double input, bool is_float) {
        if (!m_scale_mode && (input < m_low_input || input > m_high_input)) {
            if (input < m_low_input) {
                below_low.send(input);
            } else {
                above_high.send(input);
            }
        } else {
            const double input_range = m_high_input - m_low_input;
            const double output_range = m_high_output - m_low_output;
            const double mapped = ((input - m_low_input) / input_range) * output_range + m_low_output;

            if (is_float || !m_output_type_int) {
                mapped_output.send(static_cast<float>(mapped));
            } else {
                mapped_output.send(static_cast<int>(std::round(mapped)));
            }
        }
    }

    // Update the output type based on parameter types
    void update_output_type() {
        m_output_type_int = is_integer(m_low_input) && is_integer(m_high_input) &&
                            is_integer(m_low_output) && is_integer(m_high_output);
    }

    // Helper function to check if a value is an integer
    bool is_integer(double value) {
        constexpr double epsilon = 1e-6;
        return std::abs(value - std::round(value)) < epsilon;
    }
};

MIN_EXTERNAL(alea_mapper_class);
