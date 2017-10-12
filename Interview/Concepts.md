# Concepts

## Scrum
- An Agile framework for completing complex projects
- Process
  - A product owner creates a prioritized wish list called a product backlog.
  - During sprint planning, the team pulls a small chunk from the top of that wish list, a sprint backlog, and decides how to implement those pieces.
  - The team has a certain amount of time - a sprint (usually two to four weeks) - to complete its work, but it meets each day to assess its progress (daily Scrum).
  - Along the way, the ScrumMaster keeps the team focused on its goal.
  - At the end of the sprint, the work should be potentially shippable: ready to hand to a customer, put on a store shelf, or show to a stakeholder.
  - The sprint ends with a sprint review and retrospective.
  - As the next sprint begins, the team chooses another chunk of the product backlog and beings working again

## OOP
- **Object-oriented programming** is a programming language model organized around objects rather than actions and data rather than logic.
- An **object** is a collection of data and functions. When you pass an object to another part of the program, that part of the program also gets the ability to perform operations on the object, great for user-defined types. (Encapsulation)
- **Shallow equality** (Do they point to exactly the same spot in memory, the same instance) vs. **Deep equality** (We get to define).
- **Data modeling**: identify all the objects the programmer wants to manipulate and how they relate to each other.
- Allows inheritance, reducing development time, easier development experience, and more accurate coding and robustness with reusability. Also data hiding prevents instance of certain class from accidentally accessing other data - safe development. The encapsulation allows programmer to define the class with many functions and characteristics and only few functions are exposed to the user.

## Private vs. Protected
- Private data or method can only be accessed within the class.
- Protected can be accessed by this class and any subclasses of this class.

## Redux
- Redux is a JavaScript framework for managing the frontend state of a web application, allowing us to store information organized and quickly insert and retrieve that information.
- It is also very predictable as it helps you write apps that behave consistently. The state can only be modified by dispatching actions that are made with pure functions called reducers.
- Redux middlewares allows async actions, logging, and so on.
- Better development experience as it allows testing very easy and there are great tools available such as redux-devtools allowing live code editing.
- Three principles:
  - Single Source of Truth: The entire state of the application is stored in a single JavaScript object in a single store. This object is commonly referred to as a “state tree” because its values often contain or are objects themselves.
  - State is Read-Only: The only way to change the state is to dispatch an action. This principle ensures that our Redux loop is never short-circuited and change of state remains single-threaded.
  - Only Pure Functions Change State: Pure functions known as “reducers” receive the previous state and an action and return the next state. They return new state objects instead of mutating previous state. Read more about what makes a function pure.

## React
- React is a JavaScript library for creating UI components. React's specialty is exactly what its name implies: reaction. When the data that is represented by the UI changes, React reacts by updating the UI.
- Why React?
  - As your application grows in size and complexity, managing the maze of callbacks and event handlers responsible for updating your views will quickly become unwieldy. React's mission is to manage all UI updates when any piece of your app changes. Using it, we will no longer need to manually update elements on a page in response to user input! When the state of the application changes, React re-renders all elements. Thanks to the use of a 'virtual DOM', this process is just as fast as isolating the changing element.
  - It gets better: the other primary focus of React is to provide a simple interface for front-end developers to use. You describe how you want your UI to look at any given point in time and React takes care of the rest.
  - JSX is a JavaScript syntax extension that resembles HTML and XML. React code written in JSX mirrors the HTML it produces, improving readability and ease-of-development.
- How does it work?
  - In traditional JavaScript applications, you must look at which pieces of data changed and surgically update the DOM to reflect the new state. Using React, when the component is initially rendered, the markup is generated and added to the document. When the data is changed, React renders again, but instead of replacing the component wholesale, it updates only the bit that has changed. It effectively runs a 'diff' on what is there compared to what should be there. This way the absolute minimum change can be applied to the DOM. This process is called reconciliation.
  - This process of reconciliation is so fast that we don't need to carefully check which parts are rendering. We can re-render an entire page in milliseconds.

## Babel
- JavaScript development touches a lot of diverse environments: Node, Chrome, Safari, etc. These various environments have different levels of compatibility with advanced JavaScript features like JSX and ES6. To ensure that our JSX and ES6 code works in any environment, we will use a transpiler called Babel to convert our code into ES5, the universal, vanilla Javascript compatible with all browsers and Node.

## Rails
- Don’t have to spend a lot of time configuring files in order to get setup as Rails comes with a set of conventions which help speed up development and makes it easier to move between different Rails projects
- Object-oriented language Ruby and huge open source code community available
- Easily readable and self-documenting, which increases productivity
- Emphasis on RESTful application design - popular in current API shifts towards REST design
- Not as fast as Java although some big organizations such as AirBnB still uses Rails

## MVC
- The Model-view-controller (MVC) is a software architectural pattern for implementing user interface. This pattern separates concern of data, view, and logic, which allows code to be maintainable. 
- However, there are limitations to the MVC pattern when the application grow in size. 
  - Poorly defined data flow: The cascading updates which occur across views often lead to a tangled web of events which is difficult to debug. 
  - Lack of data integrity: Model data can be mutated from anywhere, yielding unpredictable results across the UI.
- The **model** is the central component of the pattern. It expresses the application’s behavior in terms of the problem domain, independent of the UI. It directly manages the data, logic, and rules of the application.
- The **view** can be any output representation of information, such as a chart or a diagram. Multiple views of the same information are possible.
- The **controller** accepts input and converts it to commands for the model or view.

## SOA (Service-oriented architecture)
- AKA “microservices” (Modularity on the application level)
- E.g. Multiple rails app (one for user, one for tweets, etc) -> tweet syntax error won’t break user authentication app
- Failures can be isolated to particular services without taking down the entire system
- Easy to divide among teams, a team can keep their codebase small and understandable
  - Can be written in various languages unlike monolith
  - Easier to do small refactorings
  - Harder to do big refactoring across many services
- A little bit of overhead in messages between apps unlike monolith

## CORS (Cross-Origin Resource Sharing)
- A resource makes a cross-origin HTTP request when it requests a resource from a different domain, protocol, or port to its own.
- For security reasons, browsers restrict cross-origin HTTP requests initiated from within scripts.
- CORS mechanism gives web servers cross-domain access controls, which enable secure cross-domain data transfers.
- It works by adding new HTTP headers that allow servers to describe the set of origins that are permitted to read that information using a web browser.

## Session Token
- Session tokens are stored on the client side in the form of JSON object. It is typically stored in the localStorage, which is domain-specific although sometimes stored in sessionStorage and even as a cookie (which is too small and most likely not the case). Session token based authentication allows stateless authorization. Once user enters their login credentials, the server verifies and returns a signed token, which is stored in localStorage. On subsequent requests, this token is included in the header which the server decodes it to be valid and processes the request. Destroyed on the client-side once a user logs out.

## HTTPS & SSL
- HTTPS is the secure version of HTTP, the protocol over which data is sent between your browser and the website that you are connected to.
- HTTPS typically uses SSL (Secure Sockets Layer) or TLS (Transport Layer Security) to encrypt all communications between your browser and the website.
- SSL utilizes asymmetric Public Key Infrastructure (PKI) system, which uses a public key and a private key to encrypt communications. Anything encrypted with the public key can only be decrypted by the private key and vice-versa.

## Hoisting
- Hoisting is the JS interpreter’s action of moving all variable and function declarations to the top of the current scope. However, only the actual declarations are hoisted.
- If variable is declared after it has been used, it won’t raise error but just show as undefined.
- If variable is never declared, we have a ReferenceError.
- Function declarations are also hoisted except functions that are assigned to variables.
  - Function foo() { } will be hoisted. foo().
  - Var foo = function() {} won’t be. foo().

## Bind / Call / Apply
- Bind allows you to borrow a method and set the value of this without calling the function. It simply returns an exact copy of the function with new value of this.
- Bind when you want that function to later be called with a certain context, useful in events.
- Call or apply when you want to invoke the function immediately and modify the context.

## This
- At the time of execution in every function, JS engine sets a property to the function called this, which refer to the current execution context. Always refers to an object.
- If you use “use strict”, immediate invoking function, value of this is undefined.

## Currying
- Creating a closure that return a function.

## Join vs. Subqueries
- A left join can be faster than an equivalent subquery because the server might be able to optimize it better - however this is up to discussion.

## TCP, UDP, TTL
- **TCP**: this data must get to the end user. Send request to server to build connection then sends packets in order. Lots of overhead and therefore slower but more secure as delivery is guaranteed and in order.
  - E.g. WhatsApp - TCP makes sure message is sent to a friend even if s/he is offline at the moment.
- **UDP**: similar but it’s not in order and no guarantee in delivery. Very low latency compared to TCP but meaning it’s very fast.
  - E.g. Uber - driver sends their location to Uber every 5 seconds and Uber app sends most recent version of this information to users when they open the app. UDP is preferred for this because this has to happen very fast but guaranteed delivery is not as important as they are constantly sending this information.
- **TTL**: Time To Live is a mechanism that limits the lifespan of data in network, implemented using timestamps or such. Improve performance of caching or privacy.

## XSS, CSRF
- **CSRF** (Cross-Site Request Forgery) attack - the attacker tries to force/trick you into making a request which you did not intend.
- **XSS** (Cross-Site Scripting) attack - the attacker makes you involuntarily execute client-side code, most likely JS.

## Lifecycle of HTTP request. Entering a URL.
1) Enter a URL into the browser (e.g. facebook.com)
2) Browser checks cache to see if the requested object or redirect response is in cache and if it is up to date, decodes response (if it’s gzipped) and determines what to do with the response (CDN? render?)
3) DNS lookup of the IP address for the corresponding domain name
4) Round-robin DNS - returns multiple IP addresses (multiple for large scale websites like facebook)
5) Load balancers that listens on a particular IP address and forwards the requests to other servers
6) Browser opens a TCP connection
7) The browser then sends a HTTP request to the web server (First check the browser cache. For dynamic pages, which expire very quickly, the browser will send GET request to the Facebook server)
8) Facebook server responds with a permanent redirect (https://www.facebook.com or even with a backslash at the end <- not much anymore)
9) Caches the redirect
10) The browser follows the redirect and sends another GET request to the new domain
11) The Facebook server will receive the GET request, process it by reading the request, parameters, and cookies to generate a HTML response
12) The server sends back a HTML response to the browser
13) Response is cached
14) The browser begins rendering the HTML
15) Depending on different scenarios and types of CDN used, the browser parses the HTML file and finds referenced images in it that is located at CDN.
16) It finds the IP address of CDN, connects to CDN server requesting the image
17) If the content is in cache and the cache entry hasn’t expired, the content is served directly from the edge server.
18) Otherwise the edge server makes a request to the origin server to retrieve the information.
19) If geographically far, instead of sending the picture, it’ll send an HTTP redirect with IP address of CDN that is geographically closer to you. (For initial CDN request)
20) This redirect step will be cached and all future requests will go to the closest content server
21) As the browser renders objects embedded in HTML, it will notice tags that require more API requests and keep sending more AJAX requests to communicate with the server.


## Slow loading
- Frontend
  - Utilize CSS Sprites - It lowers the number of HTTP requests needed to render a webpage. If we have “fast” internet connection, rather than doing multiple HTTP requests to get small contents and wait for the round-trip to the server each time, we can use CSS sprite to minimize the number of trips to the server and use the time to download a bigger file.
  - Use CDN (Content Delivery Network) to host static contents such as images, JavaScript files, and CSS files - geographically closer location to these data centers increases download speed
  - In all of my recent projects, I utilized webpack to compile all the JavaScript files and react components. However, one can actually utilize code splitting, also with webpack, to improve performance in initial load speed by loading only what is necessary on that page.
  - Caching on client side also can help speed up the loading speed as it prevents making unnecessary requests to the DB. By utilizing WebStorages or cookies and cache-control headers, we can cache both static and dynamic files and components.
    - Web Caching: storing of HTTP responses temporarily for fast retrieval later on.
    - Reduces the number of requests made to the server.
    - Caching mechanism: using caching meta tags or HTTP caching headers - decrease the bandwidth usage and also web server overload.
    - Unlike Redis / Memcached, which stores K-V pair in RAM a copy of the information on the disk of the whole page, browser cache stores resources like images, JS on your hard-drive for quicker access of these static resources on reload.
    - Make sure to clearly differentiate between server-side caching (Redis / Memcached) and browser caching (CDN, cache-control headers, cookies, static assets, JS, CSS)
- Backend
  - In terms of BE, the first step would be to making sure the DB is properly designed. One such example would be getting rid of N + 1 queries. For example, in a Rails app, you could implement eager loading by utilizing Active Record’s includes method to reduce number of queries made for often used associations.
  - Also, while not easily scalable, depending on the situation, you could consider denormalizing the database to improve read speed. Once again, this makes it hard to keep data in sync but if conducted properly, it would be very helpful
  - Most practical and obvious solution would be also utilizing caching mechanism as well. By utilizing Redis or memcached, one can store popular restaurants to avoid having to constantly hitting the DB. Utilizing LRU caching could help the process but some factors to consider here are what are the information that are essential to be up to date as to static contents. E.g. Restaurant info? Photos? Reviews?

## Singleton
- Only one instance of the class can be created.
- The Singleton pattern is used to design the classes which provides the configuration settings for an application. By implementing configuration classes as Singleton not only that we provide a global access point, but we also keep the instance we use as a cache object.

## OOP Concepts
### Abstraction
- Representing a complicated system in simplified model through information hiding and providing only the essential details to the users. (e.g. Media player abstracts the concepts of playing, pausing, fast-forwarding and so on. As a user, you can use this to operate the device.)

### Encapsulation
- Binding of data and related functions into a unit such as class (collection of objects with characteristics in common). It makes the concept of data hiding possible and protects from the “side-effects” of unwanted changes. It prevents clients from seeing its inside view, where the behavior of the abstraction is implemented. (e.g. VCR implemented this interface and encapsulated the details of the mechanical drives and tapes.)
- When a new implementation of a media player arrives (DVD player for example), it can replace the implementation encapsulated in the media player and users can continue to use it just as they did with their VCR. (same operations such as play, pause, etc.)
- Concept of information hiding through abstraction. It allows for implementation details to change without the users having to know and promotes low coupling of code.

### Inheritance
- When a class of objects is defined, any subclass that is defined can inherit the definitions of one or more general classes. An object in a subclass does not need to carry its own definition of data and methods that are generic to its superclass. Faster development process codes are reusable. Can be overridden by the use of the public, private, and protected keywords.
- **Inheritance** represent an “is-a” relationship. (e.g. a dog or a cat “is-a” pet)
- **Interface** represent “is” relationship, an addition features of a class. (e.g. Foo “is” disposable)

### Polymorphism
- “Many forms”. Allows us to have the same method take on different meanings depending on which class is instantiated. Shape class with circle and square. Calling area will return the correct results for both subclasses. **Important because it allows objects of different classes to share the same external interface while giving flexibility to change it for itself.**  (Shadowing, or overriding inheritance, is an example as this is done by implementing same method in its subclasses to override superclass’ same method)

### Dynamic Binding
- Binding means connecting one program to another program that is to be executed in reply to the call, AKA late binding. Makes polymorphism possible by executing the code under the present reference of object.

### Delegation (Composition) 
- “has a” relationship, meaning the use of instance variables that are references to other objects.

### Genericity
- Allows declaration of variables without specifying exact data type and the compiler will identify them at run time.

### Cardinality
- The degree of relationship. The number of occurrences in one associated to the number of occurrences in another.
  - One-to-one
  - One-to-many
  - Many-to-many

### Multiplicity
- Interval of positive integers to specify allowable cardinalities.

### Modularity
- Decomposing a program into a set of modules to reduce the overall complexity of the program. (Set of cohesive and loosely coupled modules.)

### Coupling 
- A measure of how closely connected software modules are. Loosely coupled system comprises of components that have little or no knowledge of other separate components.

### Cohesion
- A measure of the strength of relationship between the class’ methods and data. High cohesion is associated with reusability, understandability, and robustness.

### Interface vs. Class
- **Abstract classes** define characteristics of an object type specifying what an object is. It can have shared state or functionality. An abstract class is like a class, but differs in that it only defines “generic” methods in the class, but does not actually implement them. Class -“Do the behavior”
- **Interface** defines capabilities that we promise to provide by establishing a contract about what the object can do. It’s only a promise to provide the state or functionality and cannot be shared because there is no defined information to be shared. Interfaces are useful since they capture similarity between unrelated objects without forcing a class relationship. “Describe the behavior”
- “Interfaces do not express something like “a Doberman is a type of dog and every dog can walk” but more like “this thing can walk”.

## UML
- Define UML (https://www.codeproject.com/Articles/28445/UML-Interview-Questions-Part#DefineUML)
- Unified Modeling Language, a standard language for designing and documenting a system in an object-oriented manner. It has nine diagrams which can be used in design document to express design of software architecture.
- Why UML?
  - Easy to keep the team on the same page (especially for the new hires when the senior engineers leave)
  - In a complicated system, provides a roadmap
- Define Use Case Diagrams
  - It answers what system does from the user point of view, to depict clarity regarding a system.
  - Scenario: A sequence of events which happen when a user interacts with the system
  - Actor: The end user (Primary: initiate the use case, secondary passively participates)
  - Use Case: The goal performed by the end user.
    - Include: Include relationship represents an invocation of on use case by the other. (One function called by another function)
    - Extend: Exactly like the base use case but with some new steps inserted.
- Class Diagram
  - It is basically a prototype which helps us create objects. Class defines the static structure of the project.
    - Class name
    - Attributes (Properties of the system)
    - Methods (Methods to act on the attributes)
    - “+”: Public
    - “-”: Private (Cannot be accessed outside the class)
    - “#”: Protected (Only be seen within the component)
    - “~”: Package

## Implement LRU Cache
- Utilize hashmap and linked list
- Each node in the list will hold a cached object and we’ll always add new nodes to the end of the list. Whenever an object is requested and found in the cache, we’ll move it to the end of the list to maintain the order
- Once full, we’ll remove oldest node.
- With linked list, adding, deleting, and updating nodes can be done in constant time
- However, look up time is the problem as it is linear in time complexity. We can go around this problem by creating a hash map whose keys will be the same keys that we put in our linked list. The values will point to the node object in our linked list - constant lookup time now.

## Identifying IP
- If the users are logged into the website, the easiest way would be obviously by checking session ID. However, websites like Yelp, which has a lot of unregistered users, it could be best served by checking for unique IP addresses. This can be very inaccurate for places that serve a lot of users under same IP address such as libraries or in fact, App Academy, where I used to work at. One way to determine whether two distincts hits belong to the same user or not would be storing randomly generated unique identifier in the client ID field on the browser's’ cookies on load.








