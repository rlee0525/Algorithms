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














