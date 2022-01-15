-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2022 at 08:03 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `postsapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE contacts (
  serial_no bigint  NOT NULL,
  name varchar NOT NULL,
  email varchar NOT NULL,
  phone_no varchar NOT NULL,
  message varchar NOT NULL,
  date TIMESTAMP DEFAULT current_timestamp
) ;

--
-- Dumping data for table `contacts`
--

INSERT INTO contacts (serial_no, name, email, phone_no, message, date) VALUES
(7, 'Samruddhi Badlani', 'samruddhi4227132@gmail.com', '+919669996835', 'This is final message', '2022-01-05 23:19:00'),
(8, 'Samruddhi Badlani', 'samruddhi4227132@gmail.com', '+919669996835', 'Yar ye message hai', '2022-01-07 23:07:17');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE post (
  post_id bigint NOT NULL,
  title VARCHAR  NOT NULL,
  content VARCHAR NOT NULL,
  By VARCHAR NOT NULL,
  Date TIMESTAMP NOT NULL DEFAULT current_timestamp,
  slug varchar NOT NULL,
  img_file varchar NOT NULL,
  tagline text NOT NULL
) ;

--
-- Dumping data for table `post`
--

INSERT INTO post (post_id, title, content, By, Date, slug, img_file, tagline) VALUES
(3, 'IoT ', '                                              The Internet of Things (IoT) describes the network of physical objects—“things”—that are embedded with sensors, software, and other technologies for the purpose of connecting and exchanging data with other devices and systems over the internet. These devices range from ordinary household objects to sophisticated industrial tools. With more than 7 billion connected IoT devices today, experts are expecting this number to grow to 10 billion by 2020 and 22 billion by 2025. Oracle has a network of device partners.What technologies have made IoT possible?\r\nWhile the idea of IoT has been in existence for a long time, a collection of recent advances in a number of different technologies has made it practical.\r\n\r\nAccess to low-cost, low-power sensor technology. Affordable and reliable sensors are making IoT technology possible for more manufacturers.\r\nConnectivity. A host of network protocols for the internet has made it easy to connect sensors to the cloud and to other “things” for efficient data transfer.\r\nCloud computing platforms. The increase in the availability of cloud platforms enables both businesses and consumers to access the infrastructure they need to scale up without actually having to manage it all.\r\nMachine learning and analytics. With advances in machine learning and analytics, along with access to varied and vast amounts of data stored in the cloud, businesses can gather insights faster and more easily. The emergence of these allied technologies continues to push the boundaries of IoT and the data produced by IoT also feeds these technologies.\r\nConversational artificial intelligence (AI). Advances in neural networks have brought natural-language processing (NLP) to IoT devices (such as digital personal assistants Alexa, Cortana, and Siri) and made them appealing, affordable, and viable for home use.', 'Oracle', '2022-01-07 11:42:00', 'iot-oracle-post', 'assets/img/iot-oracle.jpg', 'All about IoT'),
(4, 'Machine learning', 'Machine learning (ML) is the study of computer algorithms that can improve automatically through experience and by the use of data.[1] It is seen as a part of artificial intelligence. Machine learning algorithms build a model based on sample data, known as training data, in order to make predictions or decisions without being explicitly programmed to do so.[2] Machine learning algorithms are used in a wide variety of applications, such as in medicine, email filtering, speech recognition, and computer vision, where it is difficult or unfeasible to develop conventional algorithms to perform the needed tasks.[3]\r\n\r\nA subset of machine learning is closely related to computational statistics, which focuses on making predictions using computers; but not all machine learning is statistical learning. The study of mathematical optimization delivers methods, theory and application domains to the field of machine learning. Data mining is a related field of study, focusing on exploratory data analysis through unsupervised learning.[5][6] Some implementations of machine learning use data and neural networks in a way that mimics the working of a biological brain.[7][8] In its application across business problems, machine learning is also referred to as predictive analytics.Learning algorithms work on the basis that strategies, algorithms, and inferences that worked well in the past are likely to continue working well in the future. These inferences can be obvious, such as \"since the sun rose every morning for the last 10,000 days, it will probably rise tomorrow morning as well\". They can be nuanced, such as \"X% of families have geographically separate species with color variants, so there is a Y% chance that undiscovered black swans exist\".[9]\r\n\r\nMachine learning programs can perform tasks without being explicitly programmed to do so. It involves computers learning from data provided so that they carry out certain tasks. For simple tasks assigned to computers, it is possible to program algorithms telling the machine how to execute all steps required to solve the problem at hand; on the computer s part, no learning is needed. For more advanced tasks, it can be challenging for a human to manually create the needed algorithms. In practice, it can turn out to be more effective to help the machine develop its own algorithm, rather than having human programmers specify every needed step.[10]', 'Wikepedia', '2022-01-08 11:55:41', 'machine-learning-post', 'assets/img/machine-learning-post.jpg', 'Machine learning is a branch of artificial intelligence (AI) and computer science which focuses on the use of data and algorithms to imitate the way that humans learn, gradually improving its accuracy'),
(5, 'Data science', 'Data science is an interdisciplinary field that uses scientific methods, processes, algorithms and systems to extract knowledge and insights from noisy, structured and unstructured data,[1][2] and apply knowledge and actionable insights from data across a broad range of application domains. Data science is related to data mining, machine learning and big data.\r\n\r\nData science is a \"concept to unify statistics, data analysis, informatics, and their related methods\" in order to \"understand and analyze actual phenomena\" with data.[3] It uses techniques and theories drawn from many fields within the context of mathematics, statistics, computer science, information science, and domain knowledge. However, data science is different from computer science and information science. Turing Award winner Jim Gray imagined data science as a \"fourth paradigm\" of science (empirical, theoretical, computational, and now data-driven) and asserted that \"everything about science is changing because of the impact of information technology\" and the data deluge.[4][5]\r\n\r\nA data scientist is someone who creates programming code, and combines it with statistical knowledge to create insights from data.Data science is an interdisciplinary field focused on extracting knowledge from data sets, which are typically large (see big data), and applying the knowledge and actionable insights from data to solve problems in a wide range of application domains.[7] The field encompasses preparing data for analysis, formulating data science problems, analyzing data, developing data-driven solutions, and presenting findings to inform high-level decisions in a broad range of application domains. As such, it incorporates skills from computer science, statistics, information science, mathematics, information visualization, data sonification, data integration, graphic design, complex systems, communication and business.[8][9] Statistician Nathan Yau, drawing on Ben Fry, also links data science to human-computer interaction: users should be able to intuitively control and explore data.[10][11] In 2015, the American Statistical Association identified database management, statistics and machine learning, and distributed and parallel systems as the three emerging foundational professional communities.', 'Wikepedia', '2022-01-08 12:04:55', 'data-science-post', '/assets/img/data-science.jfif', 'Data science is the domain of study that deals with vast volumes of data using modern tools and techniques to find unseen patterns'),
(6, 'Web Development', 'Web Development can be classified into two ways:\r\n\r\nFrontend Development\r\nBackend Development\r\nFrontend Development: The part of a website that the user interacts directly is termed as front end. It is also referred to as the ‘client side’ of the application.Frontend Roadmap:\r\nHTML: HTML stands for HyperText Markup Language. It is used to design the front end portion of web pages using markup language. It acts as a skeleton for a website since it is used to make the structure of a website.\r\nCSS: Cascading Style Sheets fondly referred to as CSS is a simply designed language intended to simplify the process of making web pages presentable. It is used to style our website.\r\nJavaScript: JavaScript is a scripting language used to provide a dynamic behavior to our website.\r\nBootstrap: Bootstrap is a free and open-source tool collection for creating responsive websites and web applications. It is the most popular CSS framework for developing responsive, mobile-first websites. Nowadays, the websites are perfect for all the browsers (IE, Firefox, and Chrome) and for all sizes of screens (Desktop, Tablets, Phablets, and Phones).\r\nBootstrap 4\r\nBootstrap 5\r\nFrontend Frameworks and Libraries:\r\n\r\nAngularJS\r\nReact.js\r\nVueJS\r\njQuery\r\nBootstrap\r\nMaterial UI\r\nTailwind CSS\r\njQuery UI\r\nSome other libraries and frameworks are: Handlebar.js Backbone.js, Ember.js etc.\r\nBackend Development: Backend is the server side of a website. It is the part of the website that users cannot see and interact. It is the portion of software that does not come in direct contact with the users. It is used to store and arrange data.\r\n\r\nBackend Roadmap:\r\nPHP: PHP is a server-side scripting language designed specifically for web development.\r\nJava: Java is one of the most popular and widely used programming language. It is highly scalable.\r\nPython: Python is a programming language that lets you work quickly and integrate systems more efficiently.\r\nNode.js: Node.js is an open source and cross-platform runtime environment for executing JavaScript code outside a browser.\r\nBack End Frameworks: The list of back end frameworks are: Express, Django, Rails, Laravel, Spring, etc.', 'GeeksforGeeks', '2022-01-08 12:12:23', 'web-development-post', 'assets/img/web-development.png', 'Web development refers to the building, creating, and maintaining of websites. It includes aspects such as web design, web publishing, web programming, and database management. It is the creation of an application that works over the internet i.e. websites.'),
(7, 'Computer programming', 'Computer programming is the process of designing and building an executable computer program to accomplish a specific computing result or to perform a particular task. Programming involves tasks such as analysis, generating algorithms, profiling algorithms  accuracy and resource consumption, and the implementation of algorithms in a chosen programming language (commonly referred to as coding).[1][2] The source code of a program is written in one or more languages that are intelligible to programmers, rather than machine code, which is directly executed by the central processing unit. The purpose of programming is to find a sequence of instructions that will automate the performance of a task (which can be as complex as an operating system) on a computer, often for solving a given problem. Proficient programming thus usually requires expertise in several different subjects, including knowledge of the application domain, specialized algorithms, and formal logic.\r\n\r\nTasks accompanying and related to programming include testing, debugging, source code maintenance, implementation of build systems, and management of derived artifacts, such as the machine code of computer programs. These might be considered part of the programming process, but often the term software development is used for this larger process with the term programming, implementation, or coding reserved for the actual writing of code. Software engineering combines engineering techniques with software development practices. Reverse engineering is a related process used by designers, analysts, and programmers to understand and re-create/re-implement\r\nCode-breaking algorithms have also existed for centuries. In the 9th century, the Arab mathematician Al-Kindi described a cryptographic algorithm for deciphering encrypted code, in A Manuscript on Deciphering Cryptographic Messages. He gave the first description of cryptanalysis by frequency analysis, the earliest code-breaking algorithm.[8]\r\n\r\nThe first computer program is generally dated to 1843, when mathematician Ada Lovelace published an algorithm to calculate a sequence of Bernoulli numbers, intended to be carried out by Charles Babbages Analytical Engine.[9]\r\n\r\n\r\nData and instructions were once stored on external punched cards, which were kept in order and arranged in program decks.\r\nIn the 1880s Herman Hollerith invented the concept of storing data in machine-readable form.[10] Later a control panel (plug board) added to his 1906 Type I Tabulator allowed it to be programmed for different jobs, and by the late 1940s, unit record equipment such as the IBM 602 and IBM 604, were programmed by control panels in a similar way, as were the first electronic computers. However, with the concept of the stored-program computer introduced in 1949, both programs and data were stored and manipulated in the same way in computer memory', 'Wikipedia', '2022-01-08 12:17:26', 'computer-programming-post', 'assets/img/computer-programming.jfif', 'A computer program is a sequence of instructions written using a Computer Programming Language to perform a specified task by the computer.'),
(8, 'Big data', 'Big data is a field that treats ways to analyze, systematically extract information from, or otherwise deal with data sets that are too large or complex to be dealt with by traditional data-processing application software. Data with many fields (columns) offer greater statistical power, while data with higher complexity (more attributes or columns) may lead to a higher false discovery rate.[2] Big data analysis challenges include capturing data, data storage, data analysis, search, sharing, transfer, visualization, querying, updating, information privacy, and data source. Big data was originally associated with three key concepts: volume, variety, and velocity.[3] The analysis of big data presents challenges in sampling, and thus previously allowing for only observations and sampling. Therefore, big data often includes data with sizes that exceed the capacity of traditional software to process within an acceptable time and value.\r\n\r\nCurrent usage of the term big data tends to refer to the use of predictive analytics, user behavior analytics, or certain other advanced data analytics methods that extract value from big data, and seldom to a particular size of data set. \"There is little doubt that the quantities of data now available are indeed large, but thats not the most relevant characteristic of this new data ecosystem.\"[4] Analysis of data sets can find new correlations to \"spot business trends, prevent diseases, combat crime and so on\".[5] Scientists, business executives, medical practitioners, advertising and governments alike regularly meet difficulties with large data-sets in areas including Internet searches, fintech, healthcare analytics, geographic information systems, urban informatics, and business informatics. Scientists encounter limitations in e-Science work, including meteorology, genomics,[6] connectomics, complex physics simulations, biology, and environmental research.[7]\r\n\r\nThe size and number of available data sets have grown rapidly as data is collected by devices such as mobile devices, cheap and numerous information-sensing Internet of things devices, aerial (remote sensing), software logs, cameras, microphones, radio-frequency identification (RFID) readers and wireless sensor networks.[8][9] The worlds technological per-capita capacity to store information has roughly doubled every 40 months since the 1980s;[10] as of 2012, every day 2.5 exabytes (2.5×260 bytes) of data are generated.[11] Based on an IDC report prediction, the global data volume was predicted to grow exponentially from 4.4 zettabytes to 44 zettabytes between 2013 and 2020. By 2025, IDC predicts there will be 163 zettabytes of data.[12] One question for large enterprises is determining who should own big-data initiatives that affect the entire organization.[13]\r\n\r\nRelational database management systems and desktop statistical software packages used to visualize data often have difficulty processing and analyzing big data. The processing and analysis of big data may require \"massively parallel software running on tens, hundreds, or even thousands of servers\".[14] What qualifies as \"big data\" varies depending on the capabilities of those analyzing it and their tools. Furthermore, expanding capabilities make big data a moving target. \"For some organizations, facing hundreds of gigabytes of data for the first time may trigger a need to reconsider data management options. For others, it may take tens or hundreds of terabytes before data size becomes a significant consideration', 'Wikipedia', '2022-01-08 12:22:33', 'big-data-post', 'assets/img/big-data.jfif', 'Big data usually includes data sets with sizes beyond the ability of commonly used software tools to capture, curate, manage, and process data within a tolerable elapsed time.[18] Big data philosophy encompasses unstructured, semi-structured and structured data, however the main focus is on unstructured data');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE contacts
  ADD PRIMARY KEY(serial_no),
  ADD CONSTRAINT serial_no UNIQUE(serial_no);

--
-- Indexes for table `post`
--
ALTER TABLE post
  ADD PRIMARY KEY (post_id),
  ADD  CONSTRAINT post_id UNIQUE(post_id);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`



create sequence contacts_serial_no_seq
   owned by contacts.serial_no;

alter table contacts
   alter column serial_no set default nextval('contacts_serial_no_seq');
--
-- AUTO_INCREMENT for table `post`
--
create sequence post_serial_no_seq
   owned by post.post_id;
   

alter table post
   alter column post_id set default nextval('post_serial_no_seq');




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
