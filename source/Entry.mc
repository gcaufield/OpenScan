// Entry.mc
//
// Entry Point for the App
// Copyright Greg Caufield 2022

using Toybox.Application as App;
using Toybox.System as Sys;
using Toybox.Time;
using MonkeyInject;

(:background, :glance)
class Entry extends App.AppBase {

  hidden var _kernel;

  function initialize() {
    AppBase.initialize();

    _kernel = new MonkeyInject.Kernel();

    _serviceBindingComplete = false;
  }

  // onStop() is called when your application is exiting
  function onStop(state) {
  }

  function bindServices() {
    if(!_serviceBindingComplete) {
      _serviceBindingComplete = true;
    }
  }

  // Return the initial view of your application here
  function getInitialView() {
    // Launching into the foreground, load the foregrond components
    bindServices();

    return [ _kernel.build(:View),
             _kernel.build(:ViewBehaviourDelegate)];
  }
}
