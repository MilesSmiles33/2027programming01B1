// Miles Smith | Sept 15 2026 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
float l, r, result;
char op;
boolean left, newEntry;
String displayVal;

void setup () {
  size(150, 250);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  displayVal = "0.0";
  left = true;
  newEntry = true;


  numButtons[0] = new Button(30, 190, 20, 20, '0');
  numButtons[1] = new Button(30, 160, 20, 20, '1');
  numButtons[2] = new Button(60, 160, 20, 20, '2');
  numButtons[3] = new Button(90, 160, 20, 20, '3');
  numButtons[4] = new Button(30, 130, 20, 20, '4');
  numButtons[5] = new Button(60, 130, 20, 20, '5');
  numButtons[6] = new Button(90, 130, 20, 20, '6');
  numButtons[7] = new Button(30, 100, 20, 20, '7');
  numButtons[8] = new Button(60, 100, 20, 20, '8');
  numButtons[9] = new Button(90, 100, 20, 20, '9');
  opButtons[0] = new Button(120, 160, 20, 20, '+');
  opButtons[1] = new Button(120, 130, 20, 20, '-');
  opButtons[2] = new Button(120, 100, 20, 20, 'x');
  opButtons[3] = new Button(120, 70, 20, 20, '÷');
  opButtons[4] = new Button(90, 70, 20, 20, 'a');
  opButtons[5] = new Button(60, 70, 20, 20, 'r');
  opButtons[6] = new Button(30, 70, 20, 20, '±');
  opButtons[7] = new Button(60, 190, 20, 20, '.');
  opButtons[8] = new Button(90, 190, 20, 20, '^');
  opButtons[9] = new Button(120, 190, 20, 20, '√');
  opButtons[10] = new Button(45, 220, 50, 20, 'C');
  opButtons[11] = new Button(105, 220, 50, 20, '=');
}

void draw () {
  background(33);
  drawDisplay();
  stroke(#D678D8);
  line(140, 10, 140, 240);
  line(10, 240, 140, 240);
  line(10, 10, 10, 240);
  line(10, 10, 140, 10);

  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void drawDisplay () {
  rectMode(CENTER);
  fill(#BEA8BF);
  rect(width/2, 30, 110, 30);
  fill(0);
  textAlign(RIGHT);
  textSize(20);
  text(displayVal, width/3+80, 43);
}

void mouseReleased() {



  // Update display with button clicked by user
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      handleEvent(numButtons[i].val, true);
    }
  }
  // Loop through opButtons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
    }
  }
  // Display Variables
  println("L:" + l);
  println("R:" + r);
  println("Result:" + result);
  println("Left:" + left);
  println("Op:" + op);
}

void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == 'x') {
    result = l * r;
  }
  displayVal = str(result);
  left = !left;
  l = result;
}

void keyPressed() {
  println("keyCode: " + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent('1', true);
  } else if (key == 50 || keyCode == 98) {
    handleEvent('2', true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent('3', true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent('4', true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent('5', true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent('6', true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent('7', true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent('8', true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent('9', true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent('0', true);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent('-', false);
  } else if (keyCode == 107) {
    handleEvent('+', false);
  }
}

void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    // Do Number stuff
    String digit = str(val);

    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }

    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    // Do operator stuff
    char clicked = val;

    if ( clicked == '=') {
      performCalc();
    } else if (clicked == '+' || clicked == '-' || clicked == 'x' || clicked == '÷') {
      op = clicked;
      left = false;
      newEntry = true;
      displayVal = str(op);
    } else if (clicked == '±') {
      if (left == true) {
        l *= -1;
        displayVal = str(l);
      } else {
        r *= -1;
        displayVal = str(r);
      }
    } else if (clicked == 'C') {
      // reset all variables
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      displayVal = "0.0";
      left = true;
      newEntry = true;
    } else if (clicked == '√') {
      // square root of value in display
      if (left == true) {
        l = sqrt(l);
        displayVal = str(l);
      } else {
        r = sqrt(r);
        displayVal = str(r);
      }
    } else if (clicked == '^') {
      // square root of value in display
      if (left == true) {
        l = sq(l);
        displayVal = str(l);
      } else {
        r = sq(r);
        displayVal = str(r);
      }
    } else if (clicked == 'r') {
      // square root of value in display
      if (left == true) {
        l = round(l);
        displayVal = str(l);
      } else {
        r = round(r);
        displayVal = str(r);
      }
    } else if (clicked == 'a') {
      // square root of value in display
      if (left == true) {
        l = abs(l);
        displayVal = str(l);
      } else {
        r = abs(r);
        displayVal = str(r);
      }
    } else if (clicked == '.') {
      if (!displayVal.contains(".")) {
        displayVal += '.';
      }
    }
  }
}
