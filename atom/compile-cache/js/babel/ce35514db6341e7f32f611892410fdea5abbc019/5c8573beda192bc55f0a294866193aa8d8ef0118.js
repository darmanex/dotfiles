Object.defineProperty(exports, '__esModule', {
  value: true
});

var _atom = require('atom');

var _helpers = require('./helpers');

var VALID_SEVERITY = new Set(['error', 'warning', 'info']);

function validateUI(ui) {
  var messages = [];

  if (ui && typeof ui === 'object') {
    if (typeof ui.name !== 'string') {
      messages.push('UI.name must be a string');
    }
    if (typeof ui.didBeginLinting !== 'function') {
      messages.push('UI.didBeginLinting must be a function');
    }
    if (typeof ui.didFinishLinting !== 'function') {
      messages.push('UI.didFinishLinting must be a function');
    }
    if (typeof ui.render !== 'function') {
      messages.push('UI.render must be a function');
    }
    if (typeof ui.dispose !== 'function') {
      messages.push('UI.dispose must be a function');
    }
  } else {
    messages.push('UI must be an object');
  }

  if (messages.length) {
    (0, _helpers.showError)('Invalid UI received', 'These issues were encountered while registering the UI named \'' + (ui && ui.name ? ui.name : 'Unknown') + '\'', messages);
    return false;
  }

  return true;
}

function validateLinter(linter, version) {
  var messages = [];

  if (linter && typeof linter === 'object') {
    if (typeof linter.name !== 'string') {
      if (version === 2) {
        messages.push('Linter.name must be a string');
      } else linter.name = 'Unknown';
    }
    if (typeof linter.scope !== 'string' || linter.scope !== 'file' && linter.scope !== 'project') {
      messages.push("Linter.scope must be either 'file' or 'project'");
    }
    if (version === 1 && typeof linter.lintOnFly !== 'boolean') {
      messages.push('Linter.lintOnFly must be a boolean');
    } else if (version === 2 && typeof linter.lintsOnChange !== 'boolean') {
      messages.push('Linter.lintsOnChange must be a boolean');
    }
    if (!Array.isArray(linter.grammarScopes)) {
      messages.push('Linter.grammarScopes must be an Array');
    }
    if (typeof linter.lint !== 'function') {
      messages.push('Linter.lint must be a function');
    }
  } else {
    messages.push('Linter must be an object');
  }

  if (messages.length) {
    (0, _helpers.showError)('Invalid Linter received', 'These issues were encountered while registering a Linter named \'' + (linter && linter.name ? linter.name : 'Unknown') + '\'', messages);
    return false;
  }

  return true;
}

function validateIndie(indie) {
  var messages = [];

  if (indie && typeof indie === 'object') {
    if (typeof indie.name !== 'string') {
      messages.push('Indie.name must be a string');
    }
  } else {
    messages.push('Indie must be an object');
  }

  if (messages.length) {
    (0, _helpers.showError)('Invalid Indie received', 'These issues were encountered while registering an Indie Linter named \'' + (indie && indie.name ? indie.name : 'Unknown') + '\'', messages);
    return false;
  }

  return true;
}

function validateMessages(linterName, entries) {
  var messages = [];

  if (Array.isArray(entries)) {
    var invalidURL = false;
    var invalidIcon = false;
    var invalidExcerpt = false;
    var invalidLocation = false;
    var invalidSeverity = false;
    var invalidSolution = false;
    var invalidReference = false;
    var invalidDescription = false;
    var invalidLinterName = false;

    for (var i = 0, _length = entries.length; i < _length; ++i) {
      var message = entries[i];
      var reference = message.reference;
      if (!invalidIcon && message.icon && typeof message.icon !== 'string') {
        invalidIcon = true;
        messages.push('Message.icon must be a string');
      }
      if (!invalidLocation && (!message.location || typeof message.location !== 'object' || typeof message.location.file !== 'string' || typeof message.location.position !== 'object' || !message.location.position)) {
        invalidLocation = true;
        messages.push('Message.location must be valid');
      } else if (!invalidLocation) {
        var range = _atom.Range.fromObject(message.location.position);
        if (Number.isNaN(range.start.row) || Number.isNaN(range.start.column) || Number.isNaN(range.end.row) || Number.isNaN(range.end.column)) {
          invalidLocation = true;
          messages.push('Message.location.position should not contain NaN coordinates');
        }
      }
      if (!invalidSolution && message.solutions && !Array.isArray(message.solutions)) {
        invalidSolution = true;
        messages.push('Message.solutions must be valid');
      }
      if (!invalidReference && reference && (typeof reference !== 'object' || typeof reference.file !== 'string' || typeof reference.position !== 'object' || !reference.position)) {
        invalidReference = true;
        messages.push('Message.reference must be valid');
      } else if (!invalidReference && reference) {
        var position = _atom.Point.fromObject(reference.position);
        if (Number.isNaN(position.row) || Number.isNaN(position.column)) {
          invalidReference = true;
          messages.push('Message.reference.position should not contain NaN coordinates');
        }
      }
      if (!invalidExcerpt && typeof message.excerpt !== 'string') {
        invalidExcerpt = true;
        messages.push('Message.excerpt must be a string');
      }
      if (!invalidSeverity && !VALID_SEVERITY.has(message.severity)) {
        invalidSeverity = true;
        messages.push("Message.severity must be 'error', 'warning' or 'info'");
      }
      if (!invalidURL && message.url && typeof message.url !== 'string') {
        invalidURL = true;
        messages.push('Message.url must be a string');
      }
      if (!invalidDescription && message.description && typeof message.description !== 'function' && typeof message.description !== 'string') {
        invalidDescription = true;
        messages.push('Message.description must be a function or string');
      }
      if (!invalidLinterName && message.linterName && typeof message.linterName !== 'string') {
        invalidLinterName = true;
        messages.push('Message.linterName must be a string');
      }
    }
  } else {
    messages.push('Linter Result must be an Array');
  }

  if (messages.length) {
    (0, _helpers.showError)('Invalid Linter Result received', 'These issues were encountered while processing messages from a linter named \'' + linterName + '\'', messages);
    return false;
  }

  return true;
}

function validateMessagesLegacy(linterName, entries) {
  var messages = [];

  if (Array.isArray(entries)) {
    var invalidFix = false;
    var invalidType = false;
    var invalidClass = false;
    var invalidRange = false;
    var invalidTrace = false;
    var invalidContent = false;
    var invalidFilePath = false;
    var invalidSeverity = false;

    for (var i = 0, _length2 = entries.length; i < _length2; ++i) {
      var message = entries[i];
      if (!invalidType && typeof message.type !== 'string') {
        invalidType = true;
        messages.push('Message.type must be a string');
      }
      if (!invalidContent && (typeof message.text !== 'string' && typeof message.html !== 'string' && !(message.html instanceof HTMLElement) || !message.text && !message.html)) {
        invalidContent = true;
        messages.push('Message.text or Message.html must have a valid value');
      }
      if (!invalidFilePath && message.filePath && typeof message.filePath !== 'string') {
        invalidFilePath = true;
        messages.push('Message.filePath must be a string');
      }
      if (!invalidRange && message.range && typeof message.range !== 'object') {
        invalidRange = true;
        messages.push('Message.range must be an object');
      } else if (!invalidRange && message.range) {
        var range = _atom.Range.fromObject(message.range);
        if (Number.isNaN(range.start.row) || Number.isNaN(range.start.column) || Number.isNaN(range.end.row) || Number.isNaN(range.end.column)) {
          invalidRange = true;
          messages.push('Message.range should not contain NaN coordinates');
        }
      }
      if (!invalidClass && message['class'] && typeof message['class'] !== 'string') {
        invalidClass = true;
        messages.push('Message.class must be a string');
      }
      if (!invalidSeverity && message.severity && !VALID_SEVERITY.has(message.severity)) {
        invalidSeverity = true;
        messages.push("Message.severity must be 'error', 'warning' or 'info'");
      }
      if (!invalidTrace && message.trace && !Array.isArray(message.trace)) {
        invalidTrace = true;
        messages.push('Message.trace must be an Array');
      }
      if (!invalidFix && message.fix && (typeof message.fix.range !== 'object' || typeof message.fix.newText !== 'string' || message.fix.oldText && typeof message.fix.oldText !== 'string')) {
        invalidFix = true;
        messages.push('Message.fix must be valid');
      }
    }
  } else {
    messages.push('Linter Result must be an Array');
  }

  if (messages.length) {
    (0, _helpers.showError)('Invalid Linter Result received', 'These issues were encountered while processing messages from a linter named \'' + linterName + '\'', messages);
    return false;
  }

  return true;
}

exports.ui = validateUI;
exports.linter = validateLinter;
exports.indie = validateIndie;
exports.messages = validateMessages;
exports.messagesLegacy = validateMessagesLegacy;
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9Vc2Vycy9kYXJtLy5hdG9tL3BhY2thZ2VzL2xpbnRlci9saWIvdmFsaWRhdGUvaW5kZXguanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7OztvQkFFNkIsTUFBTTs7dUJBQ1QsV0FBVzs7QUFHckMsSUFBTSxjQUFjLEdBQUcsSUFBSSxHQUFHLENBQUMsQ0FBQyxPQUFPLEVBQUUsU0FBUyxFQUFFLE1BQU0sQ0FBQyxDQUFDLENBQUE7O0FBRTVELFNBQVMsVUFBVSxDQUFDLEVBQU0sRUFBVztBQUNuQyxNQUFNLFFBQVEsR0FBRyxFQUFFLENBQUE7O0FBRW5CLE1BQUksRUFBRSxJQUFJLE9BQU8sRUFBRSxLQUFLLFFBQVEsRUFBRTtBQUNoQyxRQUFJLE9BQU8sRUFBRSxDQUFDLElBQUksS0FBSyxRQUFRLEVBQUU7QUFDL0IsY0FBUSxDQUFDLElBQUksQ0FBQywwQkFBMEIsQ0FBQyxDQUFBO0tBQzFDO0FBQ0QsUUFBSSxPQUFPLEVBQUUsQ0FBQyxlQUFlLEtBQUssVUFBVSxFQUFFO0FBQzVDLGNBQVEsQ0FBQyxJQUFJLENBQUMsdUNBQXVDLENBQUMsQ0FBQTtLQUN2RDtBQUNELFFBQUksT0FBTyxFQUFFLENBQUMsZ0JBQWdCLEtBQUssVUFBVSxFQUFFO0FBQzdDLGNBQVEsQ0FBQyxJQUFJLENBQUMsd0NBQXdDLENBQUMsQ0FBQTtLQUN4RDtBQUNELFFBQUksT0FBTyxFQUFFLENBQUMsTUFBTSxLQUFLLFVBQVUsRUFBRTtBQUNuQyxjQUFRLENBQUMsSUFBSSxDQUFDLDhCQUE4QixDQUFDLENBQUE7S0FDOUM7QUFDRCxRQUFJLE9BQU8sRUFBRSxDQUFDLE9BQU8sS0FBSyxVQUFVLEVBQUU7QUFDcEMsY0FBUSxDQUFDLElBQUksQ0FBQywrQkFBK0IsQ0FBQyxDQUFBO0tBQy9DO0dBQ0YsTUFBTTtBQUNMLFlBQVEsQ0FBQyxJQUFJLENBQUMsc0JBQXNCLENBQUMsQ0FBQTtHQUN0Qzs7QUFFRCxNQUFJLFFBQVEsQ0FBQyxNQUFNLEVBQUU7QUFDbkIsNEJBQVUs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QyxPQUFPLElBQUksT0FBTyxPQUFPLENBQUMsR0FBRyxDQUFDLE9BQU8sS0FBSyxRQUFRLENBQUMsQUFBQyxFQUFFO0FBQ3hMLGtCQUFVLEdBQUcsSUFBSSxDQUFBO0FBQ2pCLGdCQUFRLENBQUMsSUFBSSxDQUFDLDJCQUEyQixDQUFDLENBQUE7T0FDM0M7S0FDRjtHQUNGLE1BQU07QUFDTCxZQUFRLENBQUMsSUFBSSxDQUFDLGdDQUFnQyxDQUFDLENBQUE7R0FDaEQ7O0FBRUQsTUFBSSxRQUFRLENBQUMsTUFBTSxFQUFFO0FBQ25CLDRCQUFVLGdDQUFnQyxxRkFBa0YsVUFBVSxTQUFLLFFBQVEsQ0FBQyxDQUFBO0FBQ3BKLFdBQU8sS0FBSyxDQUFBO0dBQ2I7O0FBRUQsU0FBTyxJQUFJLENBQUE7Q0FDWjs7UUFHZSxFQUFFLEdBQWhCLFVBQVU7UUFDUSxNQUFNLEdBQXhCLGNBQWM7UUFDRyxLQUFLLEdBQXRCLGFBQWE7UUFDTyxRQUFRLEdBQTVCLGdCQUFnQjtRQUNVLGNBQWMsR0FBeEMsc0JBQXNCIiwiZmlsZSI6Ii9Vc2Vycy9kYXJtLy5hdG9tL3BhY2thZ2VzL2xpbnRlci9saWIvdmFsaWRhdGUvaW5kZXguanMiLCJzb3VyY2VzQ29udGVudCI6WyIvKiBAZmxvdyAqL1xuXG5pbXBvcnQgeyBSYW5nZSwgUG9pbnQgfSBmcm9tICdhdG9tJ1xuaW1wb3J0IHsgc2hvd0Vycm9yIH0gZnJvbSAnLi9oZWxwZXJzJ1xuaW1wb3J0IHR5cGUgeyBVSSwgTGludGVyLCBNZXNzYWdlLCBNZXNzYWdlTGVnYWN5LCBJbmRpZSB9IGZyb20gJy4uL3R5cGVzJ1xuXG5jb25zdCBWQUxJRF9TRVZFUklUWSA9IG5ldyBTZXQoWydlcnJvcicsICd3YXJuaW5nJywgJ2luZm8nXSlcblxuZnVuY3Rpb24gdmFsaWRhdGVVSSh1aTogVUkpOiBib29sZWFuIHtcbiAgY29uc3QgbWVzc2FnZXMgPSBbXVxuXG4gIGlmICh1aSAmJiB0eXBlb2YgdWkgPT09ICdvYmplY3QnKSB7XG4gICAgaWYgKHR5cGVvZiB1aS5uYW1lICE9PSAnc3RyaW5nJykge1xuICAgICAgbWVzc2FnZXMucHVzaCgnVUkubmFtZSBtdXN0IGJlIGEgc3RyaW5nJylcbiAgICB9XG4gICAgaWYgKHR5cGVvZiB1aS5kaWRCZWdpbkxpbnRpbmcgIT09ICdmdW5jdGlvbicpIHtcbiAgICAgIG1lc3NhZ2VzLnB1c2goJ1VJLmRpZEJlZ2luTGludGluZyBtdXN0IGJlIGEgZnVuY3Rpb24nKVxuICAgIH1cbiAgICBpZiAodHlwZW9mIHVpLmRpZEZpbmlzaExpbnRpbmcgIT09ICdmdW5jdGlvbicpIHtcbiAgICAgIG1lc3NhZ2VzLnB1c2goJ1VJLmRpZEZpbmlzaExpbnRpbmcgbXVzdCBiZSBhIGZ1bmN0aW9uJylcbiAgICB9XG4gICAgaWYgKHR5cGVvZiB1aS5yZW5kZXIgIT09ICdmdW5jdGlvbicpIHtcbiAgICAgIG1lc3NhZ2VzLnB1c2goJ1VJLnJlbmRlciBtdXN0IGJlIGEgZnVuY3Rpb24nKVxuICAgIH1cbiAgICBpZiAodHlwZW9mIHVpLmRpc3Bvc2UgIT09ICdmdW5jdGlvbicpIHtcbiAgICAgIG1lc3NhZ2VzLnB1c2goJ1VJLmRpc3Bvc2UgbXVzdCBiZSBhIGZ1bmN0aW9uJylcbiAgICB9XG4gIH0gZWxzZSB7XG4gICAgbWVzc2FnZXMucHVzaCgnVUkgbXVzdCBiZSBhbiBvYmplY3QnKVxuICB9XG5cbiAgaWYgKG1lc3NhZ2VzLmxlbmd0aCkge1xuICAgIHNob3dFcnJvcignSW52YWxpZCBVSSByZWNlaXZlZCcsIGBUaGVzZSBpc3N1ZXMgd2VyZSBlbmNvdW50ZXJlZCB3aGlsZSByZWdpc3RlcmluZyB0aGUgVUkgbmFtZWQgJyR7dWkgJiYgdWkubmFtZSA/IHVpLm5hbWUgOiAnVW5rbm93bid9J2AsIG1lc3NhZ2VzKVxuICAgIHJldHVybiBmYWxzZVxuICB9XG5cbiAgcmV0dXJuIHRydWVcbn1cblxuZnVuY3Rpb24gdmFsaWRhdGVMaW50ZXIobGludGVyOiBMaW50ZXIsIHZlcnNpb246IDEgfCAyKTogYm9vbGVhbiB7XG4gIGNvbnN0IG1lc3NhZ2VzID0gW11cblxuICBpZiAobGludGVyICYmIHR5cGVvZiBsaW50ZXIgPT09ICdvYmplY3QnKSB7XG4gICAgaWYgKHR5cGVvZiBsaW50ZXIubmFtZSAhPT0gJ3N0cmluZycpIHtcbiAgICAgIGlmICh2ZXJzaW9uID09PSAyKSB7XG4gICAgICAgIG1lc3NhZ2VzLnB1c2goJ0xpbnRlci5uYW1lIG11c3QgYmUgYSBzdHJpbmcnKVxuICAgICAgfSBlbHNlIGxpbnRlci5uYW1lID0gJ1Vua25vd24nXG4gICAgfVxuICAgIGlmICh0eXBlb2YgbGludGVyLnNjb3BlICE9PSAnc3RyaW5nJyB8fCAobGludGVyLnNjb3BlICE9PSAnZmlsZScgJiYgbGludGVyLnNjb3BlICE9PSAncHJvamVjdCcpKSB7XG4gICAgICBtZXNzYWdlcy5wdXNoKFwiTGludGVyLnNjb3BlIG11c3QgYmUgZWl0aGVyICdmaWxlJyBvciAncHJvamVjdCdcIilcbiAgICB9XG4gICAgaWYgKHZlcnNpb24gPT09IDEgJiYgdHlwZW9mIGxpbnRlci5saW50T25GbHkgIT09ICdib29sZWFuJykge1xuICAgICAgbWVzc2FnZXMucHVzaCgnTGludGVyLmxpbnRPbkZseSBtdXN0IGJlIGEgYm9vbGVhbicpXG4gICAgfSBlbHNlIGlmICh2ZXJzaW9uID09PSAyICYmIHR5cGVvZiBsaW50ZXIubGludHNPbkNoYW5nZSAhPT0gJ2Jvb2xlYW4nKSB7XG4gICAgICBtZXNzYWdlcy5wdXNoKCdMaW50ZXIubGludHNPbkNoYW5nZSBtdXN0IGJlIGEgYm9vbGVhbicpXG4gICAgfVxuICAgIGlmICghQXJyYXkuaXNBcnJheShsaW50ZXIuZ3JhbW1hclNjb3BlcykpIHtcbiAgICAgIG1lc3NhZ2VzLnB1c2goJ0xpbnRlci5ncmFtbWFyU2NvcGVzIG11c3QgYmUgYW4gQXJyYXknKVxuICAgIH1cbiAgICBpZiAodHlwZW9mIGxpbnRlci5saW50ICE9PSAnZnVuY3Rpb24nKSB7XG4gICAgICBtZXNzYWdlcy5wdXNoKCdMaW50ZXIubGludCBtdXN0IGJlIGEgZnVuY3Rpb24nKVxuICAgIH1cbiAgfSBlbHNlIHtcbiAgICBtZXNzYWdlcy5wdXNoKCdMaW50ZXIgbXVzdCBiZSBhbiBvYmplY3QnKVxuICB9XG5cbiAgaWYgKG1lc3NhZ2VzLmxlbmd0aCkge1xuICAgIHNob3dFcnJvcignSW52YWxpZCBMaW50ZXIgcmVjZWl2ZWQnLCBgVGhlc2UgaXNzdWVzIHdlcmUgZW5jb3VudGVyZWQgd2hpbGUgcmVnaXN0ZXJpbmcgYSBMaW50ZXIgbmFtZWQgJyR7bGludGVyICYmIGxpbnRlci5uYW1lID8gbGludGVyLm5hbWUgOiAnVW5rbm93bid9J2AsIG1lc3NhZ2VzKVxuICAgIHJldHVybiBmYWxzZVxuICB9XG5cbiAgcmV0dXJuIHRydWVcbn1cblxuZnVuY3Rpb24gdmFsaWRhdGVJbmRpZShpbmRpZTogSW5kaWUpOiBib29sZWFuIHtcbiAgY29uc3QgbWVzc2FnZXMgPSBbXVxuXG4gIGlmIChpbmRpZSAmJiB0eXBlb2YgaW5kaWUgPT09ICdvYmplY3QnKSB7XG4gICAgaWYgKHR5cGVvZiBpbmRpZS5uYW1lICE9PSAnc3RyaW5nJykge1xuICAgICAgbWVzc2FnZXMucHVzaCgnSW5kaWUubmFtZSBtdXN0IGJlIGEgc3RyaW5nJylcbiAgICB9XG4gIH0gZWxzZSB7XG4gICAgbWVzc2FnZXMucHVzaCgnSW5kaWUgbXVzdCBiZSBhbiBvYmplY3QnKVxuICB9XG5cbiAgaWYgKG1lc3NhZ2VzLmxlbmd0aCkge1xuICAgIHNob3dFcnJvcignSW52YWxpZCBJbmRpZSByZWNlaXZlZCcsIGBUaGVzZSBpc3N1ZXMgd2VyZSBlbmNvdW50ZXJlZCB3aGlsZSByZWdpc3RlcmluZyBhbiBJbmRpZSBMaW50ZXIgbmFtZWQgJyR7aW5kaWUgJiYgaW5kaWUubmFtZSA/IGluZGllLm5hbWUgOiAnVW5rbm93bid9J2AsIG1lc3NhZ2VzKVxuICAgIHJldHVybiBmYWxzZVxuICB9XG5cbiAgcmV0dXJuIHRydWVcbn1cblxuZnVuY3Rpb24gdmFsaWRhdGVNZXNzYWdlcyhsaW50ZXJOYW1lOiBzdHJpbmcsIGVudHJpZXM6IEFycmF5PE1lc3NhZ2U+KTogYm9vbGVhbiB7XG4gIGNvbnN0IG1lc3NhZ2VzID0gW11cblxuICBpZiAoQXJyYXkuaXNBcnJheShlbnRyaWVzKSkge1xuICAgIGxldCBpbnZhbGlkVVJMID0gZmFsc2VcbiAgICBsZXQgaW52YWxpZEljb24gPSBmYWxzZVxuICAgIGxldCBpbnZhbGlkRXhjZXJwdCA9IGZhbHNlXG4gICAgbGV0IGludmFsaWRMb2NhdGlvbiA9IGZhbHNlXG4gICAgbGV0IGludmFsaWRTZXZlcml0eSA9IGZhbHNlXG4gICAgbGV0IGludmFsaWRTb2x1dGlvbiA9IGZhbHNlXG4gICAgbGV0IGludmFsaWRSZWZlcmVuY2UgPSBmYWxzZVxuICAgIGxldCBpbnZhbGlkRGVzY3JpcHRpb24gPSBmYWxzZVxuICAgIGxldCBpbnZhbGlkTGludGVyTmFtZSA9IGZhbHNlXG5cbiAgICBmb3IgKGxldCBpID0gMCwgbGVuZ3RoID0gZW50cmllcy5sZW5ndGg7IGkgPCBsZW5ndGg7ICsraSkge1xuICAgICAgY29uc3QgbWVzc2FnZSA9IGVudHJpZXNbaV1cbiAgICAgIGNvbnN0IHJlZmVyZW5jZSA9IG1lc3NhZ2UucmVmZXJlbmNlXG4gICAgICBpZiAoIWludmFsaWRJY29uICYmIG1lc3NhZ2UuaWNvbiAmJiB0eXBlb2YgbWVzc2FnZS5pY29uICE9PSAnc3RyaW5nJykge1xuICAgICAgICBpbnZhbGlkSWNvbiA9IHRydWVcbiAgICAgICAgbWVzc2FnZXMucHVzaCgnTWVzc2FnZS5pY29uIG11c3QgYmUgYSBzdHJpbmcnKVxuICAgICAgfVxuICAgICAgaWYgKCFpbnZhbGlkTG9jYXRpb24gJiYgKCFtZXNzYWdlLmxvY2F0aW9uIHx8IHR5cGVvZiBtZXNzYWdlLmxvY2F0aW9uICE9PSAnb2JqZWN0JyB8fCB0eXBlb2YgbWVzc2FnZS5sb2NhdGlvbi5maWxlICE9PSAnc3RyaW5nJyB8fCB0eXBlb2YgbWVzc2FnZS5sb2NhdGlvbi5wb3NpdGlvbiAhPT0gJ29iamVjdCcgfHwgIW1lc3NhZ2UubG9jYXRpb24ucG9zaXRpb24pKSB7XG4gICAgICAgIGludmFsaWRMb2NhdGlvbiA9IHRydWVcbiAgICAgICAgbWVzc2FnZXMucHVzaCgnTWVzc2FnZS5sb2NhdGlvbiBtdXN0IGJlIHZhbGlkJylcbiAgICAgIH0gZWxzZSBpZiAoIWludmFsaWRMb2NhdGlvbikge1xuICAgICAgICBjb25zdCByYW5nZSA9IFJhbmdlLmZyb21PYmplY3QobWVzc2FnZS5sb2NhdGlvbi5wb3NpdGlvbilcbiAgICAgICAgaWYgKE51bWJlci5pc05hTihyYW5nZS5zdGFydC5yb3cpIHx8IE51bWJlci5pc05hTihyYW5nZS5zdGFydC5jb2x1bW4pIHx8IE51bWJlci5pc05hTihyYW5nZS5lbmQucm93KSB8fCBOdW1iZXIuaXNOYU4ocmFuZ2UuZW5kLmNvbHVtbikpIHtcbiAgICAgICAgICBpbnZhbGlkTG9jYXRpb24gPSB0cnVlXG4gICAgICAgICAgbWVzc2FnZXMucHVzaCgnTWVzc2FnZS5sb2NhdGlvbi5wb3NpdGlvbiBzaG91bGQgbm90IGNvbnRhaW4gTmFOIGNvb3JkaW5hdGVzJylcbiAgICAgICAgfVxuICAgICAgfVxuICAgICAgaWYgKCFpbnZhbGlkU29sdXRpb24gJiYgbWVzc2FnZS5zb2x1dGlvbnMgJiYgIUFycmF5LmlzQXJyYXkobWVzc2FnZS5zb2x1dGlvbnMpKSB7XG4gICAgICAgIGludmFsaWRTb2x1dGlvbiA9IHRydWVcbiAgICAgICAgbWVzc2FnZXMucHVzaCgnTWVzc2FnZS5zb2x1dGlvbnMgbXVzdCBiZSB2YWxpZCcpXG4gICAgICB9XG4gICAgICBpZiAoIWludmFsaWRSZWZlcmVuY2UgJiYgcmVmZXJlbmNlICYmICh0eXBlb2YgcmVmZXJlbmNlICE9PSAnb2JqZWN0JyB8fCB0eXBlb2YgcmVmZXJlbmNlLmZpbGUgIT09ICdzdHJpbmcnIHx8IHR5cGVvZiByZWZlcmVuY2UucG9zaXRpb24gIT09ICdvYmplY3QnIHx8ICFyZWZlcmVuY2UucG9zaXRpb24pKSB7XG4gICAgICAgIGludmFsaWRSZWZlcmVuY2UgPSB0cnVlXG4gICAgICAgIG1lc3NhZ2VzLnB1c2goJ01lc3NhZ2UucmVmZXJlbmNlIG11c3QgYmUgdmFsaWQnKVxuICAgICAgfSBlbHNlIGlmICghaW52YWxpZFJlZmVyZW5jZSAmJiByZWZlcmVuY2UpIHtcbiAgICAgICAgY29uc3QgcG9zaXRpb24gPSBQb2ludC5mcm9tT2JqZWN0KHJlZmVyZW5jZS5wb3NpdGlvbilcbiAgICAgICAgaWYgKE51bWJlci5pc05hTihwb3NpdGlvbi5yb3cpIHx8IE51bWJlci5pc05hTihwb3NpdGlvbi5jb2x1bW4pKSB7XG4gICAgICAgICAgaW52YWxpZFJlZmVyZW5jZSA9IHRydWVcbiAgICAgICAgICBtZXNzYWdlcy5wdXNoKCdNZXNzYWdlLnJlZmVyZW5jZS5wb3NpdGlvbiBzaG91bGQgbm90IGNvbnRhaW4gTmFOIGNvb3JkaW5hdGVzJylcbiAgICAgICAgfVxuICAgICAgfVxuICAgICAgaWYgKCFpbnZhbGlkRXhjZXJwdCAmJiB0eXBlb2YgbWVzc2FnZS5leGNlcnB0ICE9PSAnc3RyaW5nJykge1xuICAgICAgICBpbnZhbGlkRXhjZXJwdCA9IHRydWVcbiAgICAgICAgbWVzc2FnZXMucHVzaCgnTWVzc2FnZS5leGNlcnB0IG11c3QgYmUgYSBzdHJpbmcnKVxuICAgICAgfVxuICAgICAgaWYgKCFpbnZhbGlkU2V2ZXJpdHkgJiYgIVZBTElEX1NFVkVSSVRZLmhhcyhtZXNzYWdlLnNldmVyaXR5KSkge1xuICAgICAgICBpbnZhbGlkU2V2ZXJpdHkgPSB0cnVlXG4gICAgICAgIG1lc3NhZ2VzLnB1c2goXCJNZXNzYWdlLnNldmVyaXR5IG11c3QgYmUgJ2Vycm9yJywgJ3dhcm5pbmcnIG9yICdpbmZvJ1wiKVxuICAgICAgfVxuICAgICAgaWYgKCFpbnZhbGlkVVJMICYmIG1lc3NhZ2UudXJsICYmIHR5cGVvZiBtZXNzYWdlLnVybCAhPT0gJ3N0cmluZycpIHtcbiAgICAgICAgaW52YWxpZFVSTCA9IHRydWVcbiAgICAgICAgbWVzc2FnZXMucHVzaCgnTWVzc2FnZS51cmwgbXVzdCBiZSBhIHN0cmluZycpXG4gICAgICB9XG4gICAgICBpZiAoIWludmFsaWREZXNjcmlwdGlvbiAmJiBtZXNzYWdlLmRlc2NyaXB0aW9uICYmIHR5cGVvZiBtZXNzYWdlLmRlc2NyaXB0aW9uICE9PSAnZnVuY3Rpb24nICYmIHR5cGVvZiBtZXNzYWdlLmRlc2NyaXB0aW9uICE9PSAnc3RyaW5nJykge1xuICAgICAgICBpbnZhbGlkRGVzY3JpcHRpb24gPSB0cnVlXG4gICAgICAgIG1lc3NhZ2VzLnB1c2goJ01lc3NhZ2UuZGVzY3JpcHRpb24gbXVzdCBiZSBhIGZ1bmN0aW9uIG9yIHN0cmluZycpXG4gICAgICB9XG4gICAgICBpZiAoIWludmFsaWRMaW50ZXJOYW1lICYmIG1lc3NhZ2UubGludGVyTmFtZSAmJiB0eXBlb2YgbWVzc2FnZS5saW50ZXJOYW1lICE9PSAnc3RyaW5nJykge1xuICAgICAgICBpbnZhbGlkTGludGVyTmFtZSA9IHRydWVcbiAgICAgICAgbWVzc2FnZXMucHVzaCgnTWVzc2FnZS5saW50ZXJOYW1lIG11c3QgYmUgYSBzdHJpbmcnKVxuICAgICAgfVxuICAgIH1cbiAgfSBlbHNlIHtcbiAgICBtZXNzYWdlcy5wdXNoKCdMaW50ZXIgUmVzdWx0IG11c3QgYmUgYW4gQXJyYXknKVxuICB9XG5cbiAgaWYgKG1lc3NhZ2VzLmxlbmd0aCkge1xuICAgIHNob3dFcnJvcignSW52YWxpZCBMaW50ZXIgUmVzdWx0IHJlY2VpdmVkJywgYFRoZXNlIGlzc3VlcyB3ZXJlIGVuY291bnRlcmVkIHdoaWxlIHByb2Nlc3NpbmcgbWVzc2FnZXMgZnJvbSBhIGxpbnRlciBuYW1lZCAnJHtsaW50ZXJOYW1lfSdgLCBtZXNzYWdlcylcbiAgICByZXR1cm4gZmFsc2VcbiAgfVxuXG4gIHJldHVybiB0cnVlXG59XG5cbmZ1bmN0aW9uIHZhbGlkYXRlTWVzc2FnZXNMZWdhY3kobGludGVyTmFtZTogc3RyaW5nLCBlbnRyaWVzOiBBcnJheTxNZXNzYWdlTGVnYWN5Pik6IGJvb2xlYW4ge1xuICBjb25zdCBtZXNzYWdlcyA9IFtdXG5cbiAgaWYgKEFycmF5LmlzQXJyYXkoZW50cmllcykpIHtcbiAgICBsZXQgaW52YWxpZEZpeCA9IGZhbHNlXG4gICAgbGV0IGludmFsaWRUeXBlID0gZmFsc2VcbiAgICBsZXQgaW52YWxpZENsYXNzID0gZmFsc2VcbiAgICBsZXQgaW52YWxpZFJhbmdlID0gZmFsc2VcbiAgICBsZXQgaW52YWxpZFRyYWNlID0gZmFsc2VcbiAgICBsZXQgaW52YWxpZENvbnRlbnQgPSBmYWxzZVxuICAgIGxldCBpbnZhbGlkRmlsZVBhdGggPSBmYWxzZVxuICAgIGxldCBpbnZhbGlkU2V2ZXJpdHkgPSBmYWxzZVxuXG4gICAgZm9yIChsZXQgaSA9IDAsIGxlbmd0aCA9IGVudHJpZXMubGVuZ3RoOyBpIDwgbGVuZ3RoOyArK2kpIHtcbiAgICAgIGNvbnN0IG1lc3NhZ2UgPSBlbnRyaWVzW2ldXG4gICAgICBpZiAoIWludmFsaWRUeXBlICYmIHR5cGVvZiBtZXNzYWdlLnR5cGUgIT09ICdzdHJpbmcnKSB7XG4gICAgICAgIGludmFsaWRUeXBlID0gdHJ1ZVxuICAgICAgICBtZXNzYWdlcy5wdXNoKCdNZXNzYWdlLnR5cGUgbXVzdCBiZSBhIHN0cmluZycpXG4gICAgICB9XG4gICAgICBpZiAoIWludmFsaWRDb250ZW50ICYmICgodHlwZW9mIG1lc3NhZ2UudGV4dCAhPT0gJ3N0cmluZycgJiYgKHR5cGVvZiBtZXNzYWdlLmh0bWwgIT09ICdzdHJpbmcnICYmICEobWVzc2FnZS5odG1sIGluc3RhbmNlb2YgSFRNTEVsZW1lbnQpKSkgfHwgKCFtZXNzYWdlLnRleHQgJiYgIW1lc3NhZ2UuaHRtbCkpKSB7XG4gICAgICAgIGludmFsaWRDb250ZW50ID0gdHJ1ZVxuICAgICAgICBtZXNzYWdlcy5wdXNoKCdNZXNzYWdlLnRleHQgb3IgTWVzc2FnZS5odG1sIG11c3QgaGF2ZSBhIHZhbGlkIHZhbHVlJylcbiAgICAgIH1cbiAgICAgIGlmICghaW52YWxpZEZpbGVQYXRoICYmIG1lc3NhZ2UuZmlsZVBhdGggJiYgdHlwZW9mIG1lc3NhZ2UuZmlsZVBhdGggIT09ICdzdHJpbmcnKSB7XG4gICAgICAgIGludmFsaWRGaWxlUGF0aCA9IHRydWVcbiAgICAgICAgbWVzc2FnZXMucHVzaCgnTWVzc2FnZS5maWxlUGF0aCBtdXN0IGJlIGEgc3RyaW5nJylcbiAgICAgIH1cbiAgICAgIGlmICghaW52YWxpZFJhbmdlICYmIG1lc3NhZ2UucmFuZ2UgJiYgdHlwZW9mIG1lc3NhZ2UucmFuZ2UgIT09ICdvYmplY3QnKSB7XG4gICAgICAgIGludmFsaWRSYW5nZSA9IHRydWVcbiAgICAgICAgbWVzc2FnZXMucHVzaCgnTWVzc2FnZS5yYW5nZSBtdXN0IGJlIGFuIG9iamVjdCcpXG4gICAgICB9IGVsc2UgaWYgKCFpbnZhbGlkUmFuZ2UgJiYgbWVzc2FnZS5yYW5nZSkge1xuICAgICAgICBjb25zdCByYW5nZSA9IFJhbmdlLmZyb21PYmplY3QobWVzc2FnZS5yYW5nZSlcbiAgICAgICAgaWYgKE51bWJlci5pc05hTihyYW5nZS5zdGFydC5yb3cpIHx8IE51bWJlci5pc05hTihyYW5nZS5zdGFydC5jb2x1bW4pIHx8IE51bWJlci5pc05hTihyYW5nZS5lbmQucm93KSB8fCBOdW1iZXIuaXNOYU4ocmFuZ2UuZW5kLmNvbHVtbikpIHtcbiAgICAgICAgICBpbnZhbGlkUmFuZ2UgPSB0cnVlXG4gICAgICAgICAgbWVzc2FnZXMucHVzaCgnTWVzc2FnZS5yYW5nZSBzaG91bGQgbm90IGNvbnRhaW4gTmFOIGNvb3JkaW5hdGVzJylcbiAgICAgICAgfVxuICAgICAgfVxuICAgICAgaWYgKCFpbnZhbGlkQ2xhc3MgJiYgbWVzc2FnZS5jbGFzcyAmJiB0eXBlb2YgbWVzc2FnZS5jbGFzcyAhPT0gJ3N0cmluZycpIHtcbiAgICAgICAgaW52YWxpZENsYXNzID0gdHJ1ZVxuICAgICAgICBtZXNzYWdlcy5wdXNoKCdNZXNzYWdlLmNsYXNzIG11c3QgYmUgYSBzdHJpbmcnKVxuICAgICAgfVxuICAgICAgaWYgKCFpbnZhbGlkU2V2ZXJpdHkgJiYgbWVzc2FnZS5zZXZlcml0eSAmJiAhVkFMSURfU0VWRVJJVFkuaGFzKG1lc3NhZ2Uuc2V2ZXJpdHkpKSB7XG4gICAgICAgIGludmFsaWRTZXZlcml0eSA9IHRydWVcbiAgICAgICAgbWVzc2FnZXMucHVzaChcIk1lc3NhZ2Uuc2V2ZXJpdHkgbXVzdCBiZSAnZXJyb3InLCAnd2FybmluZycgb3IgJ2luZm8nXCIpXG4gICAgICB9XG4gICAgICBpZiAoIWludmFsaWRUcmFjZSAmJiBtZXNzYWdlLnRyYWNlICYmICFBcnJheS5pc0FycmF5KG1lc3NhZ2UudHJhY2UpKSB7XG4gICAgICAgIGludmFsaWRUcmFjZSA9IHRydWVcbiAgICAgICAgbWVzc2FnZXMucHVzaCgnTWVzc2FnZS50cmFjZSBtdXN0IGJlIGFuIEFycmF5JylcbiAgICAgIH1cbiAgICAgIGlmICghaW52YWxpZEZpeCAmJiBtZXNzYWdlLmZpeCAmJiAodHlwZW9mIG1lc3NhZ2UuZml4LnJhbmdlICE9PSAnb2JqZWN0JyB8fCB0eXBlb2YgbWVzc2FnZS5maXgubmV3VGV4dCAhPT0gJ3N0cmluZycgfHwgKG1lc3NhZ2UuZml4Lm9sZFRleHQgJiYgdHlwZW9mIG1lc3NhZ2UuZml4Lm9sZFRleHQgIT09ICdzdHJpbmcnKSkpIHtcbiAgICAgICAgaW52YWxpZEZpeCA9IHRydWVcbiAgICAgICAgbWVzc2FnZXMucHVzaCgnTWVzc2FnZS5maXggbXVzdCBiZSB2YWxpZCcpXG4gICAgICB9XG4gICAgfVxuICB9IGVsc2Uge1xuICAgIG1lc3NhZ2VzLnB1c2goJ0xpbnRlciBSZXN1bHQgbXVzdCBiZSBhbiBBcnJheScpXG4gIH1cblxuICBpZiAobWVzc2FnZXMubGVuZ3RoKSB7XG4gICAgc2hvd0Vycm9yKCdJbnZhbGlkIExpbnRlciBSZXN1bHQgcmVjZWl2ZWQnLCBgVGhlc2UgaXNzdWVzIHdlcmUgZW5jb3VudGVyZWQgd2hpbGUgcHJvY2Vzc2luZyBtZXNzYWdlcyBmcm9tIGEgbGludGVyIG5hbWVkICcke2xpbnRlck5hbWV9J2AsIG1lc3NhZ2VzKVxuICAgIHJldHVybiBmYWxzZVxuICB9XG5cbiAgcmV0dXJuIHRydWVcbn1cblxuZXhwb3J0IHtcbiAgdmFsaWRhdGVVSSBhcyB1aSxcbiAgdmFsaWRhdGVMaW50ZXIgYXMgbGludGVyLFxuICB2YWxpZGF0ZUluZGllIGFzIGluZGllLFxuICB2YWxpZGF0ZU1lc3NhZ2VzIGFzIG1lc3NhZ2VzLFxuICB2YWxpZGF0ZU1lc3NhZ2VzTGVnYWN5IGFzIG1lc3NhZ2VzTGVnYWN5LFxufVxuIl19