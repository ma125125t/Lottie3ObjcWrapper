import Foundation
import UIKit
import Lottie

@objc public class LottieAnimationView: UIView {

    @objc public var loop:Bool {
        get {
            return animationView.loopMode == .loop
        }
        set {
            animationView.loopMode = newValue ? .loop : .playOnce
        }
    }

    @objc public var speed:CGFloat {
        get {
            return animationView.animationSpeed
        }
        set {
            animationView.animationSpeed = newValue
        }
    }

    @objc public var progress:AnimationProgressTime {
        get {
            return animationView.currentProgress
        }
        set {
            animationView.currentProgress = newValue
        }
    }

    private let animationView: AnimationView

    @objc public override init(frame: CGRect) {
        animationView = AnimationView()

        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        animationView = AnimationView()

        super.init(coder: aDecoder)
        commonInit()
    }

    // MARK: - Public Functions

    @objc public func loadAnimation(name animationName:String) {
        if let path = Bundle.main.path(forResource: animationName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let animation:Animation = try JSONDecoder().decode(Animation.self, from: data)
                animationView.animation = animation
            } catch {
                assertionFailure("Could not read Lottie json file")
            }
        }
    }

    /**
     Plays the animation from its current state to the end.

     - Parameter completion: An optional completion closure to be called when the animation completes playing.
     */
    @objc public func play(completion: LottieCompletionBlock? = nil) {
        animationView.play(completion: completion)
    }

    /**
     Pauses the animation in its current state.

     The completion closure will be called with `false`
     */
    public func pause() {
        animationView.pause()
    }

    /**
     Stops the animation and resets the view to its start frame.

     The completion closure will be called with `false`
     */
    @objc func stop() {
        animationView.stop()
    }

    // MARK: Play with progress

    /**
     Plays the animation from a progress (0-1) to a progress (0-1).

     - Parameter fromProgress: The start progress of the animation.
     - Parameter toProgress: The end progress of the animation.
     - Parameter loopMode: The loop behavior of the animation.
     - Parameter completion: An optional completion closure to be called when the animation stops.
     */
    @objc func play(fromProgress from: AnimationProgressTime,
                    toProgress to: AnimationProgressTime,
                    loop loopBool: Bool,
                    completion: LottieCompletionBlock? = nil) {
        let loopMode:LottieLoopMode = loopBool ? .loop : .playOnce
        animationView.play(fromProgress: from, toProgress: to, loopMode: loopMode, completion: completion)
    }

    /**
     Plays the animation from a progress (0-1) to a progress (0-1). The view's `loopMode` property will be used.

     - Parameter fromProgress: The start progress of the animation.
     - Parameter toProgress: The end progress of the animation.
     - Parameter completion: An optional completion closure to be called when the animation stops.
     */
    @objc func play(fromProgress from: AnimationProgressTime,
                    toProgress to: AnimationProgressTime,
                    completion: LottieCompletionBlock? = nil) {
        animationView.play(fromProgress: from, toProgress: to, loopMode: nil, completion: completion)
    }

    /**
     Plays the animation from the current progress to a progress (0-1).

     - Parameter toProgress: The end progress of the animation.
     - Parameter loopMode: The loop behavior of the animation.
     - Parameter completion: An optional completion closure to be called when the animation stops.
     */
    @objc func play(toProgress to: AnimationProgressTime,
                    loop loopBool: Bool,
                    completion: LottieCompletionBlock? = nil) {
        let loopMode:LottieLoopMode = loopBool ? .loop : .playOnce
        animationView.play(fromProgress: nil, toProgress: to, loopMode: loopMode, completion: completion)
    }

    /**
     Plays the animation from the current progress to a progress (0-1). The view's `loopMode` property will be used

     - Parameter toProgress: The end progress of the animation.
     - Parameter completion: An optional completion closure to be called when the animation stops.
     */
    @objc func play(toProgress to: AnimationProgressTime,
                    completion: LottieCompletionBlock? = nil) {
        animationView.play(fromProgress: nil, toProgress: to, loopMode: nil, completion: completion)
    }

    // MARK: Play with frame

    /**
     Plays the animation from a start frame to an end frame in the animation's framerate.

     - Parameter fromFrame: The start frame of the animation.
     - Parameter toFrame: The end frame of the animation.
     - Parameter loopMode: The loop behavior of the animation.
     - Parameter completion: An optional completion closure to be called when the animation stops.
     */
    @objc func play(fromFrame from: AnimationFrameTime,
                    toFrame to: AnimationFrameTime,
                    loop loopBool: Bool,
                    completion: LottieCompletionBlock? = nil) {
        let loopMode:LottieLoopMode = loopBool ? .loop : .playOnce
        animationView.play(fromFrame: from, toFrame: to, loopMode: loopMode, completion: completion)
    }

    /**
     Plays the animation from a start frame to an end frame in the animation's framerate. The view's `loopMode` property will be used.

     - Parameter fromFrame: The start frame of the animation.
     - Parameter toFrame: The end frame of the animation.
     - Parameter completion: An optional completion closure to be called when the animation stops.
     */
    @objc func play(fromFrame from: AnimationFrameTime,
                    toFrame to: AnimationFrameTime,
                    completion: LottieCompletionBlock? = nil) {
        animationView.play(fromFrame: from, toFrame: to, loopMode: nil, completion: completion)

    }

    /**
     Plays the animation from the current frame to an end frame in the animation's framerate.

     - Parameter toFrame: The end frame of the animation.
     - Parameter loopMode: The loop behavior of the animation.
     - Parameter completion: An optional completion closure to be called when the animation stops.
     */
    @objc func play(toFrame to: AnimationFrameTime,
                    loop loopBool: Bool,
                    completion: LottieCompletionBlock? = nil) {
        let loopMode:LottieLoopMode = loopBool ? .loop : .playOnce
        animationView.play(fromFrame: nil, toFrame: to, loopMode: loopMode, completion: completion)

    }

    /**
     Plays the animation from the current frame to an end frame in the animation's framerate. The view's `loopMode` property will be used.

     - Parameter toFrame: The end frame of the animation.
     - Parameter completion: An optional completion closure to be called when the animation stops.
     */
    @objc func play(toFrame to: AnimationFrameTime,
                    completion: LottieCompletionBlock? = nil) {
        animationView.play(fromFrame: nil, toFrame: to, loopMode: nil, completion: completion)
    }

    // MARK: Play with marker

    /**
     Plays the animation from a named marker to another marker.

     Markers are point in time that are encoded into the Animation data and assigned
     a name.

     NOTE: If markers are not found the play command will exit.

     - Parameter fromMarker: The start marker for the animation playback.
     - Parameter toMarker: The end marker for the animation playback.
     - Parameter loopMode: The loop behavior of the animation.
     - Parameter completion: An optional completion closure to be called when the animation stops.
     */
    @objc func play(fromMarker from: String,
                    toMarker to: String,
                    loop loopBool: Bool,
                    completion: LottieCompletionBlock? = nil) {
        let loopMode:LottieLoopMode = loopBool ? .loop : .playOnce
        animationView.play(fromMarker: from, toMarker: to, loopMode: loopMode, completion: completion)
    }

    /**
     Plays the animation from a named marker to another marker. The view's `loopMode` property will be used.

     Markers are point in time that are encoded into the Animation data and assigned
     a name.

     NOTE: If markers are not found the play command will exit.

     - Parameter fromMarker: The start marker for the animation playback.
     - Parameter toMarker: The end marker for the animation playback.
     - Parameter completion: An optional completion closure to be called when the animation stops.
     */
    @objc func play(fromMarker from: String,
                    toMarker to: String,
                    completion: LottieCompletionBlock? = nil) {
        animationView.play(fromMarker: from, toMarker: to, loopMode: nil, completion: completion)
    }

    /**
     Plays the animation the current progress to a named marker.

     Markers are point in time that are encoded into the Animation data and assigned
     a name.

     NOTE: If markers are not found the play command will exit.

     - Parameter toMarker: The end marker for the animation playback.
     - Parameter loopMode: The loop behavior of the animation.
     - Parameter completion: An optional completion closure to be called when the animation stops.
     */
    @objc func play(toMarker to: String,
                    loop loopBool: Bool,
                    completion: LottieCompletionBlock? = nil) {
        let loopMode:LottieLoopMode = loopBool ? .loop : .playOnce
        animationView.play(fromMarker: nil, toMarker: to, loopMode: loopMode, completion: completion)
    }

    /**
     Plays the animation from the current progress to named marker. The view's `loopMode` property will be used.

     Markers are point in time that are encoded into the Animation data and assigned
     a name.

     NOTE: If markers are not found the play command will exit.

     - Parameter toMarker: The end marker for the animation playback.
     - Parameter completion: An optional completion closure to be called when the animation stops.
     */
    @objc func play(toMarker to: String,
                    completion: LottieCompletionBlock? = nil) {
        animationView.play(fromMarker: nil, toMarker: to, loopMode: nil, completion: completion)
    }

    // MARK: - Private

    private func commonInit() {
//        translatesAutoresizingMaskIntoConstraints = false
        setUpViews()
    }

    private func setUpViews() {
        animationView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(animationView)
        animationView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        animationView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        animationView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        animationView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
