#include "c74_min.h"

using namespace c74::min;

class alea_bendover : public object<alea_bendover> {
public:
    MIN_DESCRIPTION {"Fold values over limits set by the user"};
    MIN_TAGS {"utility"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"scale, clip"};

    inlet<> input {this, "(float/int) value to be folded"};
    inlet<> low_limit {this, "(float/int) low limit"};
    inlet<> high_limit {this, "(float/int) high limit"};

    outlet<> output {this, "(float/int) folded output"};

    alea_bendover(const atoms& args = {}) {
        if (args.size() > 0) {
            m_low_limit = safe_cast_to_double(args[0]);
        }

        if (args.size() > 1) {
            m_high_limit = safe_cast_to_double(args[1]);
        }

        // Ensure high limit is greater than low limit
        if (m_high_limit <= m_low_limit) {
            m_high_limit = m_low_limit + 1.0;
        }
    }

    message<> bang {this, "bang", "Fold the input value",
        MIN_FUNCTION {
            fold_value();
            return {};
        }
    };

    message<> float_input {this, "float", "Set value to be folded or limits",
        MIN_FUNCTION {
            if (inlet == 0) {
                m_value = args[0];
                fold_value();
            } else if (inlet == 1) {
                m_low_limit = args[0];
                if (m_high_limit <= m_low_limit) {
                    m_high_limit = m_low_limit + 1.0;
                }
            } else if (inlet == 2) {
                m_high_limit = args[0];
                if (m_high_limit <= m_low_limit) {
                    m_high_limit = m_low_limit + 1.0;
                }

            }
            return {};
        }
    };

    message<> int_input {this, "int", "Set value to be folded or limits",
        MIN_FUNCTION {
            if (inlet == 0) {
                m_value = static_cast<double>(args[0]);
                fold_value();
            } else if (inlet == 1) {
                m_low_limit = static_cast<double>(args[0]);
                if (m_high_limit <= m_low_limit) {
                    m_high_limit = m_low_limit + 1.0;
                }
            } else if (inlet == 2) {
                m_high_limit = static_cast<double>(args[0]);
                if (m_high_limit <= m_low_limit) {
                    m_high_limit = m_low_limit + 1.0;
                }
            }
            return {};
        }
    };

private:
    double m_value {0.0};
    double m_low_limit {0.0};
    double m_high_limit {1.0};

    void fold_value() {
        double n = m_value;
        double a = m_low_limit;
        double b = m_high_limit;
        constexpr double tolerance = 1e-9;

        if (std::abs(a - b) < tolerance) {
            output.send(a);
            return;
        }

        while (n < a || n > b) {
            if (n < a) {
                n = 2 * a - n;
            } else if (n > b) {
                n = 2 * b - n;
            }
        }

        output.send(n);
    }

    double safe_cast_to_double(const atom& a) {
        if (a.a_type == c74::max::A_LONG) {
            return static_cast<double>(a.a_w.w_long);
        } else if (a.a_type == c74::max::A_FLOAT) {
            return static_cast<double>(a.a_w.w_float);
        } else {
            return 0.0;
        }
    }
};

MIN_EXTERNAL(alea_bendover);
