# hook_pre_cooked_hooks

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Flutter Hooks

Flutter Hooks are majorly inspired by React Library. Hooks are a new kind of object that manages the life cycle of a Widget. They exist for one reason: to increase the code sharing between widgets by removing duplicates. 

- Hooks are used inside the build() method.
- Hooks are independent of each other & independent of widgets.
- Similar to state, Hooks are stored in the elements of the widget.
- Widget store List<Hooks>, unlike the single state.
- Hook.use() return the Hooks sequentially.
- We can create our hook by extending the HookWidget and adding the implementation.
- On creating the new hook, one should use the use prefix.
- Hooks should not be called inside the conditional statement.

List of PreCooked Hooks
- useState()
- useEffect()
- useMemoized()
- useRef()
- useCallback()
- useContext()
- useValueChanged()

useState()
*** This useState() is a value notifier provider. This method creates, subscribes, and listens to the changes.

useEffect()
*** In this method, We can do the implementation and dispose. This method is called synchronously in every build, unless[keys] is specified. In which case [useEffect] is called again only if any value inside [keys] has changed.

useMemoized()
*** This method caches the complex instances. Calculates the function for the first time and stores it, whenever this method is recalled, it returns the previously saved value. 

useRef()
*** An object that contains single mutable properties. Will not re-render the changes with every value change. useRef() will remember the data.

useCallback()
*** This hook is mainly used when we've to do the caching of an object. This hook caches the entire function, if the same method is called again. It maintains the state, rather than recreating it. It caches the whole function and processes it. It will change the value, when the dependencies mentioned in [keys] change, and return the new output.

useContext()
*** This hook is very simple to use, whenever we need the context, we can use this hook. Using this hook we can avoid passing the context.

useValueChanged()
*** This is a value notifier hook. If there is a change in any other value Notifier, based on that, if We want to perform some other action then this hook.

useReducer()
*** This hook is almost similar to useState(). This hook is used for complex data types. Complex data means that we have to update the value according to the state. 


