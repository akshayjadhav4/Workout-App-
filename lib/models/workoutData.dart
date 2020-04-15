import 'package:flutter/cupertino.dart';

class workout {
  int sr;
  final String name;
  String information;
  String imageName;
  int rep;
  Color colorName;

  workout(
      {this.sr,
      this.name,
      this.information,
      this.imageName,
      this.rep,
      this.colorName});
}

List<workout> workoutData = [
  new workout(
      sr: 1,
      name: "The High Plank",
      information:
          "Start on your hands and knees on the ground. Your hands and knees should be shoulder-width apart, hands under shoulders and knees under hips.\nLift your knees off the ground and step your feet back, bringing your body to full extension. You want to create one long line that connects your shoulders, hips, and ankles.\nReach back through your heels and forward through the crown of your head. To keep your neck and spine in a neutral position, try aiming your chin about six inches in front of your body.\nKeeping a tight core is key here. Tighten your quads, engage your abdominals, and push through your palms. Keep those hips lifted and don't forget to breathe!\nMoving your feet closer together will make this exercise more challenging.",
      imageName: 'assets/one.png',
      rep: 60,
      colorName: Color(0xff74B9FF)),
  new workout(
      sr: 2,
      name: "Biceps Curl",
      information:
          "Hold a dumbbell in each hand at the sides with palms facing in toward the side of the thigh and arms straight down.\n"
          "Position the feet comfortably about shoulder-width apart. Brace the core muscles to be ready to lift the weight.\n"
          "Lift one dumbbell toward the shoulder, rotating the arm as it moves up so that the palm with the dumbbell is now facing upward (supine) and the elbow is pointing to the ground with the forearm almost vertical.\nKeep the elbow close to the body. Exhale while lifting."
          "Lower to the side position and perform the same movement with the other arm. Inhale while lowering the weight.\n"
          "Continue to alternate until the set is complete.\n"
          " Do 10 curls with each arm for three sets. If this is too much to start with, don't reduce the weight but do five exercises with each arm.\n",
      imageName: 'assets/seven.png',
      rep: 60,
      colorName: Color(0xff75DA8B)),
  new workout(
      sr: 3,
      name: "LEG-RAISES",
      information: "Lie on your back, legs straight and together.\n"
          "Keep your legs straight and lift them all the way up to the ceiling until your butt comes off the floor.\n"
          "Slowly lower your legs back down till they’re just above the floor. Hold for a moment.\n"
          "Raise your legs back up. Repeat.\n",
      imageName: 'assets/five.png',
      rep: 60,
      colorName: Color(0xffF9DDA4)),
  new workout(
      sr: 4,
      name: "Crunch ",
      information:
          "Lie down on your back. Plant your feet on the floor, hip-width apart.\n"
          "Bend your knees and place your arms across your chest.\n"
          "Contract your abs and inhale.\n"
          "Exhale and lift your upper body, keeping your head and neck relaxed.\n"
          "Inhale and return to the starting position",
      imageName: 'assets/two.png',
      rep: 60,
      colorName: Color(0xff25CCF7)),
  new workout(
      sr: 5,
      name: "Sit Ups ",
      information: "Start by lying on your back with your knees bent.\n"
          "Put your fingertips on the back of your ears\n"
          "Lift your torso up as close to your thighs as possible.\n"
          "Lower your torso down to the floor so you’re back in the starting position.\n"
          "Inhale and return to the starting position",
      imageName: 'assets/three.png',
      rep: 60,
      colorName: Color(0xffFAC42F)),
  new workout(
      sr: 6,
      name: "Handstand on the Ball",
      information:
          "Begin by laying your tummy down on the ball. Walk your hands forward until just your toes are on the ball. Plant your hands strongly on the floor about shoulder width apart and with straight arms, engage your abdominals, push your chest forward toward the ball, and lift your hips straight up and back over your shoulders. Go to your tippy toes on the ball to help move the hips over your shoulders.  Stay here for 3 full, deep breaths and release by stretching your legs back out. This pose engages your core, turns you upside down, opens your heart, and invigorates your whole body!",
      imageName: 'assets/eight.png',
      rep: 60,
      colorName: Color(0xffEA7773)),
  new workout(
      sr: 7,
      name: "Rowing workout",
      information: "Row 250 meters"
          "Rest 1 minute"
          "Total duration: 20 minutes"
          "Note: This interval workout has a 1:1 work-to-rest ratio. The rowing should be completed in less than a minute. Rest one minute, then repeat for a total of 10 rounds.",
      imageName: 'assets/ten.png',
      rep: 60,
      colorName: Color(0xff45CE30)),
  new workout(
      sr: 8,
      name: "Push Ups",
      information:
          "Start in a pushup position as you grip a pair of hex dumbbells placed shoulder-width apart, your palms facing in. Keep your feet about hip-width apart."
          "Lower down into a pushup until your body hovers just above the floor. Your body should stay in a straight line from head to heels the entire time."
          "Pause, and then push yourself back up. Now bring one dumbbell toward your rib cage and return it to the floor."
          "Do another pushup, and row with your other arm. Continue to alternate arms every rep.",
      imageName: 'assets/six.png',
      rep: 60,
      colorName: Color(0xffFF3E4D)),
  new workout(
      sr: 9,
      name: "LYING-TRICEPS-EXTENSION",
      information:
          "lie on your weights bench with your feet flat on the ground. Hold the bar with a supinated (palms facing your face) or pronated grip (easier for beginners), with your hands shoulder width apart. Without locking your elbows, bend your forearm to bring the bar above your forehead. From this position, extend your forearms to raise the bar above your head.",
      imageName: 'assets/twelve.png',
      rep: 60,
      colorName: Color(0xff3498DB)),
];
