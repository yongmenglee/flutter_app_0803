// Helper functions.

/// Print break lines to separate current section from previous sections.
///
/// Called in between each section.
void printBreakLines({String character = "#", int numChar = 1}) {
  print(character * numChar);
}

/// Print lesson title specified by [title] and update lesson count.
///
/// Called at the beginning of every lesson.
int printLessonTitle(String title, {int count = 0}) {
  final maxLength = 60;

  String newCountString = count.toString();
  String newTitle = "| " + newCountString + ". " + title + " |";
  int titleLength = newTitle.length;

  if (titleLength < maxLength) {
    // Insert trailing spaces to the title.
    int titleLengthDiff = maxLength - titleLength;
    newTitle = newTitle.substring(0, titleLength - 1);
    newTitle += (" " * titleLengthDiff) + "|";
  } else if (titleLength > maxLength) {
    // Trim the title with trailing dots (...).
    newTitle = newTitle.substring(0, maxLength - 5);
    newTitle += "... |";
  }

  // Set Horizontal borders
  String horizBorder = "-" * maxLength;
  String titleWithBorders = "";

  // Combine all lines
  titleWithBorders += "\n" + horizBorder + "\n" + newTitle + "\n" + horizBorder;

  print(titleWithBorders);

  return count + 1;
}
