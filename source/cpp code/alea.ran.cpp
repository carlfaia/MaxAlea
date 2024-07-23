#include "c74_min.h"
#include <random>
#include <array>

using namespace c74::min;

class alea_ran : public object<alea_ran> {
public:
    MIN_DESCRIPTION {"Generates random numbers using Mersenne Twister"};
    MIN_TAGS {"random"};
    MIN_AUTHOR {"Carl Faia"};
    MIN_RELATED {"random, unified"};

    inlet<> input {this, "(bang) generate Mersenne Twister random number"};
    outlet<> output {this, "(float) random number"};

    alea_ran(const atoms& args = {})
        : m_gen(std::random_device{}()), m_mode(5), m_count(0) {
        if (!args.empty()) {
            m_mode = std::clamp(static_cast<int>(args[0]), 1, 6);
        }
        if (args.size() > 1) {
            long seed_value = args[1];
            set_seed(static_cast<uint32_t>(seed_value));
        } else {
            set_seed(static_cast<uint32_t>(std::random_device{}()));
        }
    }

    message<> bang {this, "bang", "Generate and output a random number",
        MIN_FUNCTION {
            m_count++;
            double value = generate();
            output.send(value);
            return {};
        }
    };

    message<> seed {this, "seed", "Set the random seed",
        MIN_FUNCTION {
            if (!args.empty()) {
                long seed_value = args[0];
                set_seed(static_cast<uint32_t>(seed_value));
            }
            return {};
        }
    };

    message<> mode {this, "mode", "Set the output mode (1-6)",
        MIN_FUNCTION {
            if (!args.empty()) {
                m_mode = std::clamp(static_cast<int>(args[0]), 1, 6);
            }
            return {};
        }
    };

    message<> info {this, "info", "Print current state information",
        MIN_FUNCTION {
            cout << "Mode: " << m_mode << endl;
            cout << "Count: " << m_count << endl;
            cout << "Seed: " << m_seed << endl;
            cout << "Last value: " << m_last_value << endl;
            return {};
        }
    };

private:
    std::mt19937 m_gen;   // Mersenne Twister generator from <random>
    uint32_t m_seed = 0;  // Current seed value
    int m_mode = 5;       // Mode of output (1-6)
    long m_count = 0;     // Count of generated numbers
    double m_last_value = 0;  // Last generated value

    // Constants for the original Mersenne Twister implementation
    static constexpr int N = 624;
    static constexpr int M = 397;
    static constexpr uint32_t MATRIX_A = 0x9908b0dfUL;
    static constexpr uint32_t UPPER_MASK = 0x80000000UL;
    static constexpr uint32_t LOWER_MASK = 0x7fffffffUL;

    std::array<uint32_t, N> mt;  // State vector for MT19937
    int mti = N + 1;             // Index for MT19937

    // Set the seed for both std::mt19937 and the original MT19937 implementation
    void set_seed(uint32_t s) {
        m_seed = s;
        m_gen.seed(s);
        m_count = 0;

        // Seed the original MT19937 implementation
        mt[0] = s & 0xffffffffUL;
        for (mti = 1; mti < N; mti++) {
            mt[mti] = (1812433253UL * (mt[mti-1] ^ (mt[mti-1] >> 30)) + mti);
            mt[mti] &= 0xffffffffUL;
        }
    }

    // Generate a random 32-bit integer using the original MT19937 implementation
    uint32_t genrand_int32_original() {
        uint32_t y;
        static const uint32_t mag01[2] = {0x0UL, MATRIX_A};

        if (mti >= N) {  // Generate N words at one time
            int kk;

            if (mti == N+1)
                set_seed(5489UL);  // Default seed

            for (kk = 0; kk < N - M; kk++) {
                y = (mt[kk] & UPPER_MASK) | (mt[kk+1] & LOWER_MASK);
                mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1UL];
            }
            for (; kk < N - 1; kk++) {
                y = (mt[kk] & UPPER_MASK) | (mt[kk+1] & LOWER_MASK);
                mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1UL];
            }
            y = (mt[N-1] & UPPER_MASK) | (mt[0] & LOWER_MASK);
            mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1UL];

            mti = 0;
        }

        y = mt[mti++];

        // Tempering
        y ^= (y >> 11);
        y ^= (y << 7) & 0x9d2c5680UL;
        y ^= (y << 15) & 0xefc60000UL;
        y ^= (y >> 18);

        return y;
    }

    // Generate a random floating-point number using the original MT19937 implementation
    double genrand_real2_original() {
        return static_cast<double>(genrand_int32_original()) * (1.0 / 4294967296.0);  // divided by 2^32
    }

    // Generate a random number based on the selected mode
    double generate() {
        double result;
        switch (m_mode) {
            case 1: // [0, 1] uniform
                result = std::uniform_real_distribution<>(0.0, 1.0)(m_gen);
                break;
            case 2: // [0, 1) uniform
                result = std::uniform_real_distribution<>(0.0, std::nextafter(1.0, 0.0))(m_gen);
                break;
            case 3: // (0, 1) uniform
                result = std::uniform_real_distribution<>(std::nextafter(0.0, 1.0), std::nextafter(1.0, 0.0))(m_gen);
                break;
            case 4: // Original MT19937 implementation
                result = genrand_real2_original();
                break;
            case 5: // Default: (0, 1) uniform, using std::mt19937
                result = std::uniform_real_distribution<>(0.0, 1.0)(m_gen);
                break;
            case 6: // [0, 1) with 53-bit resolution, using std::mt19937
                std::uniform_int_distribution<uint64_t> dist(0, (1ULL << 53) - 1);
                result = static_cast<double>(dist(m_gen)) / (1ULL << 53);
                break;
        }
        m_last_value = result;
        return result;
    }
};

MIN_EXTERNAL(alea_ran);
