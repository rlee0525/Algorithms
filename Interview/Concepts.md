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
















