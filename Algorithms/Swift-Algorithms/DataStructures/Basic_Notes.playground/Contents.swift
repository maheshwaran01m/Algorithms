import Foundation

/*
 Float -> 32 bit
 Double -> 64 bit
 CGFloat(Core Graphics Float) -> 32/64 bit (expect watchOS always 32 bit)
 */

/// ``When using arrays, what’s the difference between map() and compactMap()?``
/*
 Map -> transform to different object or same
 CompactMap -> transform nonOptional
 
 let numbers = ["1", "2", "3", "Four"]
 // map ["1", "2", "3", nil]
 let integers = numbers.compactMap(Int.init)
 // compactMap ["1", "2", "3"]
 
 */

/// ``What are property observers?``
/*
 property observers let us attach code to be run before and/or after a property
 changes, using `willSet and didSet` respectively
 
 Example:
 
 var score = 0
 adding 1 to an score triggers several SwiftUI views to reload, or a disk write,
 
 */

/// ``What does the final keyword do``
/*
 Marking a class as final means it cannot be subclassed
 
 You want to avoid marking specific overridden initializers as required.
 
 Example: API Manager.
 */

/// ``What is the difference between weak and unowned?``
/*
 when we use a weak closure capture, the thing we’re capturing is made available as a regular optional, whereas when we use unowned we get an implicitly unwrapped optional. Either way, we are not strongly capturing the value, which means it might not be present.
 
 Unowned is faster allows for immutability and nonOptionality, if it's nil will lead to crash.
 */

/// ``What problem does optional chaining solve?``
/*
 Optional chaining makes our code concise by removing all sorts of cruft that really doesn’t matter – we get to queue up multiple pieces of optional work in a single line of code, and have execution automatically stop if any of the optionals end up being nil.

 When Apple originally announced Swift, optional chaining was introduced with this Objective-C code
 */

/// ``Apart from the built-in ones, can you give an example of property wrappers? ``
/*
 custom one for your custom needs like `capatilized`, `FileSaver`
 */

/// `` What is generics``
/*
 func add(a: Int, b: Int) -> Int {
   a + b
 }

 func addUsingGeneric<T: Numeric>(a: T, b: T) -> T {
   a + b
 }
 addUsingGeneric(a: Float(0.5), b: Float(3.0))
 
 extension URL {
     func decode<T: Decodable>(_ type: T.Type) async throws -> T {
         let (data, _) = try await URLSession.shared.data(from: self)
         return try JSONDecoder().decode(T.self, from: data)
     }
 }
 */

// MARK: - FrameWorks

/// `` What are the advantages and disadvantages of SwiftUI compared to UIKit?``
/*
 There are many advantages to both UIKit and SwiftUI, and there are probably just as many disadvantages, so pick whichever ones you feel most comfortable with and start from there.

 MARK: For UIKit, the advantages include:

 The full power of all of Apple’s APIs, from iOS 2.0 through to the latest, greatest things from WWDC, whereas SwiftUI often gets only a subset of features.
 Complete control over the way your app looks and works, unlike SwiftUI’s sometimes rigid approach to system UI.
 You use the same design patterns seen in other Apple frameworks, including target-action and delegation. SwiftUI’s result builders are very new, and haven’t seen much adopting at Apple outside of Swift Charts.
 Many existing apps are written in UIKit, so having knowledge of that framework might be a requirement at the company. An increasing number of companies are moving to SwiftUI, but the weight is still on UIKit’s side.
 
 
 MARK: For SwiftUI, the advantages include:

 Significantly simpler syntax for creating layouts, with none of the complexity of Auto Layout.
 Automatic state management using bindings and property wrappers like @State and @ObservedObject, compared to having to shuttle data around manually with UIKit.
 The ability to create apps on all of Apple’s platforms from a single codebase, compared to having UIKit, AppKit, and WatchKit previously.
 Some things only support SwiftUI, such as widgets and Swift Charts, so even a UIKit-focused company is likely to have some SwiftUI in there somewhere.
 
 */


/// `` What is UserDefaults good for? What is UserDefaults not good for?``
/*
 UserDefaults is the simplest way of storing user data, which makes it appealing for beginners, but also useful for even experienced developers who need a sensible place to stash away user preferences.
 
 There are several important points to mention when answering this question:

 The UserDefaults system can only store property list types, which means integers, Booleans, Double, strings, Date, UUID, Data, and arrays and dictionaries of those. If you want to store other types, even those that are Codable, it takes more work.
 Nothing that is remotely sensitive should be stored in UserDefaults, because it is not encrypted or otherwise protected by the system. The keychain is the correct place to store sensitive data.
 Because UserDefaults data is designed to store a user’s customization settings, it’s loaded immediately as your app is launched. This means if you store a lot of data in there, your app will launch more slowly.
 On tvOS Apple places a limit of 512KB on UserDefaults, explicitly forcing developers to be more careful with its usage.
 All those downsides make UserDefaults sound like a pretty terrible choice for storing user data, but it’s extraordinary ease of accessibility is enticing. For example, SwiftUI’s @AppStorage property wrapper makes it almost invisible to read and write this stored data, even reinvoking a view’s body property when the value changes. UserDefaults is also helpful when combined with app groups, because it allows easy data sharing between your app and any extensions you provide.

 Remember, your goal here isn’t to defend UserDefaults: being up front about what it does well alongside its shortcomings is a great, pragmatic answer.
 
 */

/// `` What is the purpose of size classes?``
/*
 we have horizontal and vertical size classes, and each one can be regular or compact depending on how much space we have
 available to us.

 They are primarily used so we can adapt our layouts to make the best use of available space – perhaps
 spanning information horizontally when we have lots of space there, but then switching to a vertical layout when space is
 tight.
 
 SwiftUI’s ViewThatFits view helps give us more precise control over the kind of layouts
 
 */

/// `` What is the purpose of NotificationCenter?``
/*
 NotificationCenter is designed for two main purposes:

 - So that any part of your app can register to receive system messages, such as the keyboard appearing or a screenshot being taken.
 - So that you can send messages inside your app in a completely distributed way.
 
 - one to many relationship.
 
 NotificationCenter.default.post(name: .init("FlushLogs"), object: nil)
 
 let notification = Notification(name: .init("FlushLogs"))
 NotificationQueue.default.enqueue(notification, postingStyle: .whenIdle, coalesceMask: .none, forModes: nil)
 
 - only synchronously
 
 
 For Asynchronously
 
 use `NotificationQueue`
 
 */

/// ``What does the @Published property wrapper do? ``
/*
 Property wrappers let us add additional behaviors to properties, local variables, and function parameters.
 
 In the case of @Published, this will cause a Combine change announcement to be sent when this variable is modified, which will in turn cause any SwiftUI views monitoring the parent class to reload their body property.
 
 We might use @Published on the isLoggedIn property of a User class, so that our UI accurately reflects the user’s current authentication status no matter where it changes.
 
 @Published is designed to be used on one property in an ObservableObject class, whereas @State is designed to be used on one value type property in a SwiftUI view.
 That answers the straightforward part of the question, but to make a real impact you should go beyond just the raw facts:

 What happens if you modify an @Published property when you aren’t running on the main actor? Bad things, that’s what: Xcode will throw up runtime warnings that the results could be unexpected.
 
 If you need more control, you should ditch @Published and add your own property observer that triggers objectWillChange.send() alongside whatever other logic you need.
 
 Using @Published creates a publisher out of the property, so you can use the $ operator to chain Combine operators as needed.

 
 */

/// `` How can an observable object announce changes to SwiftUI?``
/*
 The simplest option is to mark properties with the @Published property wrapper, which will cause Combine to send out change announcements whenever the property changes so that any observing SwiftUI views will reinvoke their body property. The common alternative is to use objectWillChange.send() to publish a change announcement manually, but that still means any observing SwiftUI views will reinvoke their body property.

 Realistically, @Published is doing the work of objectWillChange.send() for us, just silently, however it does more than that because the resulting property has publisher we can access using its projected value – we can treat it like any other kind of Combine publisher, which means we could debounce it, delay it, sink it, and more.
 
 For more complex publishing where you need extra logic, for example to bulk updates together or to send change announcements only sometimes, use objectWillChange.send().
 
 
 import Combine

 class Debouncer<T>: ObservableObject {
     @Published var input: T
     @Published var output: T

     private var textDebounce: AnyCancellable?

     init(initialValue: T, delay: Double = 1) {
         self.input = initialValue
         self.output = initialValue

         textDebounce = $input
             .debounce(for: .seconds(delay), scheduler: DispatchQueue.main)
             .sink { [weak self] in
                 self?.output = $0
             }
     }
 }
 
 */

/// `` How does CloudKit differ from Core Data``
/*
 Core Data is designed for local storage, whereas CloudKit is designed for remote storage. 
 
 Yes, the two link together like I said, to the point where Core Data can automatically synchronize using CloudKit to provide data transfer over the network, but we’re looking at how they differ so don’t get too bogged down here.

 The main real difference between the two is how we define our data:

 In Core Data we must define entities and their attributes up front using a model editor, whereas in CloudKit we create structure simply by storing records – we don’t need to do anything up front.
 In Core Data relationships are usually from the parent to the child, e.g. a company has many employees, and might also have an inverse, whereas in CloudKit we prefer relationships to be from the child to the parent.
 Understanding that second point thoroughly is really important, because it’s key to how CloudKit approaches consistency. If you had a company that owned an array of employees, and two different devices attempted to add to the array at the same time, you’d get a collision – which version was correct? But with CloudKit’s approach of making children refer to their parents, you can add two new employees at the same time and they would both be added to the company without a collision.
 
 */


// MARK: - Architecture

/// ``Can you explain MVVM, and how it might be used on Apple's platforms? ``
/*
 Model (raw data), View (layouts), and View models
 
 So, get the basics out of the way: MVVM splits our code up into model (raw data), view (layouts), and view models, with the goal being that view models specifically do not handle layout-specific code and can therefore be tested. All the controller code that MVC would require to shuttle data between models and views is removed in MVVM, because it’s handled by bindings that ensure the two parts of our code stay in sync. That last part is important, because it’s what allows view models to get away from UI code and instead focus on logic.

 Where things get less clear cut is what view models actually do, because if something isn’t a model or a view it inevitably means a lot of work gets placed on view models. That means serialization, validation, networking, and more can end up in super-sized view models, which makes for rather unpleasant code if you aren’t careful.

 From a coding perspective this is of course an undesirable goal, but from an interview perspective it’s a gold mine because it gives you lots of scope to point our real-world problems with MVVM – where does all that logic go? Do we need to break view models up into smaller parts? How much a role should there be for an “app model” to handle shared data? Should networking and data access be spun out into its own distinct controller, much like we often do with Core Data?

 In terms of how this relates to Apple’s frameworks, in UIKit in AppKit using MVVM isn’t impossible but does pretty much mean fighting against the system, but in SwiftUI MVVM is a really natural fit. Apple wouldn’t call it out specifically - arguably because MVVM is a Microsoft invention – but their own sample code, documentation, and WWDC videos all use MVVM, so I don’t think you’d ruffle any feathers by saying that MVVM is a great choice for SwiftUI apps.
 
 */

/// `` How would you explain dependency injection to a junior developer?``
/*
 Explicitly sending data from parent to child gives us a simpler data flow, whereas having every child need to discover its own configuration means we have data moving in every direction.
 
 If a child object is able to decide for itself what data to operate on, it becomes much harder to write good tests – we aren’t able to mock our data inputs, for example.
 
 struct Parent {
     func createChild() -> Child {
         let username = UserDefaults.standard.string(forKey: "Username") ?? "Anonymous"
         return Child(username: username)
     }
 }

 struct Child {
     var username: String
 }
 
 */

/// `` How would you explain protocol-oriented programming to a new Swift developer?``
/*
 
 The four pillars of OOP are Abstraction, Encapsulation, Inheritance, and Polymorphism. In practice these end up being a bit more complicated because we talk about classes and objects, access modifiers, overriding methods, dynamic dispatch, and more, but the four pillars remain true.

 What POP does is replace Inheritance with Composition: rather than encouraging us to produce big stacks of subclasses, our goal becomes to isolate discrete functionality inside a protocol, then have our types adopt those protocols to gain whatever behavior is inside. So, that’s the basic concept, and it’s important you get that across before picking which direction to focus on.
 
 */

/// `` where singletons might be a good idea?``
/*
 FileManager and NotificationCenter are most commonly used as singletons, as is UIApplication. Heck, UIApplication will even crash if you try and make your own!
 
 class Logger {
     static var shared = Logger()
     private init() { }
 }
 
 */

/// `` When would you choose an environment object over an observed object?``
/*
 Injecting into the environment is simpler and causes less clutter, particularly for chains of views, and especially
 particularly when intermediate views don’t need the value. So, if View A made the object and needs to hand it to View E
 via views B, C, and D that don’t need access to the object, using @ObservedObject is both annoying and inefficient.
 
 */

// MARK: - Tools

/// `` How much experience do you have testing with VoiceOver?``
/*
 I would start by focusing specifically on what VoiceOver is there for, because it’s pretty much the central component of all of Apple’s assistive technology stack. That means I’d start by discussing the importance of using system components to get great VoiceOver support out of the box, then move on to adding custom labels and hints to improve the experience.
 */

/// `` How do you create your UI layouts – storyboards or in code?``
/*
 genuinely prefer code, it depends on the company project and time.
 */

/// `` How would you identify and resolve a retain cycle?``
/*
 retain cycles occur when two objects hold strong references to each other, and so Swift’s automatic reference counting system is unable to destroy either of them. That’s not necessarily bad: some types of data need to stay alive for the entire duration of our app so having the retain cycle isn’t an issue, and some types of leaks are okay – unused caches are effectively leaks, but unless you’ve managed to cache completely the wrong data it’s still important to keep caches around.
 */

/// `` ``
/* */

/// `` ``
/* */

/// `` ``
/* */

/// `` ``
/* */

/// `` ``
/* */

/// `` ``
/* */

