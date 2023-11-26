<a name="top"></a>

# Master's Thesis

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#run">Run</a></li>
      </ul>
    </li>
    <li><a href="#thesis">Features</a></li>
    <li>
      <a href="#sample-apps">Sample apps</a>
      <ul>
        <li><a href="#demo">Demo</a></li>
      </ul>
    </li>
  </ol>
</details>

## About The Project

This project contains Thesis paper, sample mobile applications implemented and data gathered during the research. It was created within my Master's degree studies at _Wrocław University of Science and Technology_.

#### Thesis title
_Comparative analysis of selected cross-platform frameworks in relation to native development approaches_

#### Abstract
_There are various aspects affecting the overall perception of quality of a mobile application, with performance being one of the most significant, especially from the perspective of the user. Having that in mind, it is crucial to understand the differences between the available mobile development approaches and in which use cases they are able to provide the highest value._

_The purpose of this master's thesis was to perform a comparative analysis of native and cross-platform approaches to mobile development. The primary basis for the comparison was the performance of applications created using those methods. Exemplary applications were implemented with Kotlin, Swift, Flutter, and React Native, to be used as the environment for the experiments. The experiments provided results considering the selected performance metrics, CPU usage, memory and power consumption, and frame rate stability. The results were interpreted in order to find benefits and/or weaknesses of the studied technologies, as well as to try to define optimal scenarios for their use._

### Built With

![Kotlin](https://img.shields.io/badge/kotlin-%237F52FF.svg?style=for-the-badge&logo=kotlin&logoColor=white)
![Swift](https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![React Native](https://img.shields.io/badge/react_native-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)

![Android Studio](https://img.shields.io/badge/Android%20Studio-3DDC84.svg?style=for-the-badge&logo=android-studio&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)

![LaTeX](https://img.shields.io/badge/latex-%23008080.svg?style=for-the-badge&logo=latex&logoColor=white)

Testing: <a href="https://www.gamebench.net/for-publishers/">GameBench Studio Pro</a>

<p align="right">(<a href="#top">back to top</a>)</p>



## Getting Started

To get a copy of one of the sample apps running on your machine follow these steps.

### Prerequisites

* Relevant SDKs installed _(e.g., Flutter SDK and Dart SDK for Flutter apps)_

* Relevant IDE

### Installation

1. Clone this repository:

   ```
   git clone https://github.com/macSro/Masters-Thesis.git
   ```

2. Navigate to the cloned directory:

   ```
   cd Masters-Thesis
   ```

3. Navigate to the relevant app directory, eg.:

   ```
   cd flutter_animations
   ```

4. Install dependencies if required, e.g.:

   ```
   flutter pub get
   ```

5. Some other steps may be necessary in case of different techologies, please refer to the relevant documentation

### Run

1. Inside your IDE select the target device

2. Run the app with IDE "Run" button or by executing a relevant command, e.g.:

```
flutter run
```

<p align="right">(<a href="#top">back to top</a>)</p>



## Thesis 

The complete paper can be found in ```TeX/thesis.pdf```.



## Sample apps

In order to somehow abstract the testing environment, the most common and significant functionalities were extracted from available mobile applications to provide a list of elements that should be
tested. The following research scenarios are proposed in relation to the selected functionalities:

#### Research scenario 1: List scrolling and filtering
One of the most common elements of mobile applications is a scrollable list view. It can be found in social media apps, news apps, games and e-commerce apps. Additionally, quite often a mechanism of filtering those lists by the user is applied. For this research scenario, a view should be constructed with a scrollable and filterable list of randomly generated text data.

#### Research scenario 2: Animations
Currently, a big emphasis is put on the look and feel of mobile applications in order to guarantee the highest level of user experience. One of the crucial aspects are the animations, which both improve the visuals but also provide the user with the feedback resulting from the actions performed. For this research scenario, a view should be constructed with exemplary animations utilized, e.g., element size change, rotations.

#### Research scenario 3: File I/O (Input & Output)
Another important functionality that can be found in many popular applications is the ability to upload files to the app from the device storage, as well as save files with some app data on the device. For this research scenario, a view should be constructed with the buttons enabling uploading and presenting an image from the device and saving a file with some text data.

#### Research scenario 4: Common UI elements
User interface layouts are built with many different components, such as toggle buttons, drop-down buttons, and text fields. One of the most common usage of text fields are fillable forms that can be found in registration process, for example. Moreover, almost always there are multiple pages that can be navigated between. For this research scenario, a view should be constructed with a bottom navigation bar enabling switching between two views. The first view should consist of various controls, e.g., toggle buttons, and the second view should include a text field form. Additionally, there should be a button enabling navigating to a separate page.

### Demo

https://github.com/macSro/Masters-Thesis/assets/56345054/2cd10ec6-c6be-47d2-86e8-d4f7a24e4527

https://github.com/macSro/Masters-Thesis/assets/56345054/c5473f74-765b-4317-bcec-363f4dbdb4cc

https://github.com/macSro/Masters-Thesis/assets/56345054/2d1250e9-5e76-44d6-a313-f69db075f1c1

https://github.com/macSro/Masters-Thesis/assets/56345054/5beff2ab-e835-427f-b4a9-241c45c201ea



<p align="right">(<a href="#top">back to top</a>)</p>
