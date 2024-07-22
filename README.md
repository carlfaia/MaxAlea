# MaxAlea: Max.alea: A Stochastic Toolkit for Max


## Introduction

**MaxAlea** is a comprehensive collection of stochastic tools and algorithms for the Max environment. Originally inspired by Mikhail Malt's PatchWork library from the early 1990s, Max.alea has evolved into a dynamic, real-time toolkit for experimental and creative work with probabilistic processes.

## Key Features

- **Real-time manipulation of stochastic processes**
- **Diverse collection of random distributions and algorithms**
- **Implementations of random walks and 1/f noise**
- **Utility objects designed specifically for stochastic operations**
- **Consistent, high-quality random number generation**

## History and Development

Initiated in 1996, Max.alea has undergone several iterations to keep pace with evolving Macintosh architecture. The latest version, completely rewritten using the Min-DevKit in `C++`, ensures compatibility with modern Max environments on both Intel and Apple Silicon Macs. While primarily developed for macOS, the source code is available on GitHub, facilitating potential Windows ports by the community.

## Unique Approach to Randomness

Max.alea employs a seeded random number generator based on the Mersenne Twister algorithm, ensuring high-quality, non-repeating sequences of random numbers. This approach differs from the default random functions in Max and other environments, offering more robust and diverse random behaviors.

## Using the Library

1. Place the externals in your Max Packages folder.
2. Access help files directly from Max by right-clicking on objects.
3. Explore the included example patches for practical applications.

## Components

- **Random Distributions** (e.g., Gaussian, Poisson, Weibull)
- **Random Walk and 1/f Noise Algorithms**
- **Markov Chain Analysis and Generation**
- **Data Mapping and Scaling Utilities**
- **Bounded Random Value Generators**

## Applications

- Algorithmic Composition
- Generative Art and Sound Design
- Interactive Installations
- Data Sonification
- Stochastic Modeling in Various Fields

## Future Development

Max.alea is an ongoing project. Planned additions include more stochastic models, enhanced utilities, and comprehensive documentation. Community feedback and contributions are welcome.

## Acknowledgments

Special thanks to Mikhail Malt for the original inspiration and guidance, and to Richard Dudas for his invaluable assistance in refining the original code.

## Contact

For questions, comments, or contributions, please contact:
Carl Faia - cf@carlfaia.com or carl.faia@brunel.ac.uk


### Bibliography

- Ames, C. (1991). A catalog of statistical distributions: The techniques for transforming random, determinate and chaotic sequences. *Leonardo Music Journal*, 1(1), 55-70.
- Baffioni, C., Guerra, F., & Laura, T. L. (1989). The theory of stochastic processes and dynamical systems as a basis for models of musical structures. In *ATTI del Convegno di Modena, 1989*.
- Bolognesi, T. (1979). Composizione automatica: Dalla musica 1/f alla musica autosimile. In *ATTI del 3° Colloquio di Informatica Musicale, Univ. di Padova, 2-3 aprile 1979*.
- Di Scipio, A. (1990). Composition by exploration of non-linear dynamic systems. In *ICMC Proceedings 1990*.
- Dodge, C., & Jerse, T. (1985). *Computer Music*. Schirmer Books.
- Lorrain, D. (1980). Une panoplie de canons stochastiques. Rapport IRCAM no. 30, Paris. (Also available in English in *The Music Machine*, edited by Curtis Roads.)
- Siddall, J., & Siddall, J. C. (1977). New developments in stochastic computer music. In *ICMC 1977*.
- Voss, R. F., & Clarke, J. (1978). 1/f noise in music: Music from 1/f noise. *Journal of the Acoustical Society of America*, 63(1), 258-261.
- Xenakis, I. (1981). *Musiques Formelles*. Stock Musique.

### Additional Reading 

- Biles, J. A. (2013). *GenJam: A genetic algorithm for generating jazz solos*. In R. Kronland-Martinet, S. Ystad, & K. Jensen (Eds.), *Computer Music Modeling and Retrieval* (pp. 2-27). Springer.
- Hoffmann, P. (2019). *The stochastic synthesis of Iannis Xenakis*. In S. P. Souvlaki (Ed.), *Xenakis Matters* (pp. 45-59). MIT Press.
- Lazzarini, V. (2016). *A sound design perspective on stochastic synthesis*. In *Sound and Music Computing Conference 2016* (pp. 10-17).
- Manzo, V. J. (2016). *Max/MSP/Jitter for music: A practical guide to developing interactive music systems for education and more*. Oxford University Press.
- Pearson, M. (2011). *Generative art: A practical guide using Processing*. Manning Publications.
- Roads, C. (2004). *Microsound*. MIT Press.
- DuBois, R. L. (2010). *The sound of numbers: Aural models of data*. In *Data Sonification: Theory, Methods, and Applications* (pp. 133-147). CRC Press.

### Modern Web Resources 
- Shiffman, D. (2012). *The nature of code*. Nature of Code. Retrieved from [https://natureofcode.com/](https://natureofcode.com/)
- Taube, H. (2013). *Algorithmic composition: A gentle introduction to music composition using Common LISP and Common Music*. Michigan Publishing. Retrieved from [https://quod.lib.umich.edu/s/spobooks/bbv9810.0001.001](https://quod.lib.umich.edu/s/spobooks/bbv9810.0001.001)

### Online Resources

- GitHub Repository: [Your GitHub link]
- Max Package Manager: [If applicable]
- Documentation: [Link to online documentation, if available]

**Note:** This library is provided as-is, under [MIT License with Attribution]. Users are encouraged to explore, modify, and expand upon these tools for their creative and research endeavors.
