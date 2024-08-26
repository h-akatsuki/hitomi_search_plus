#include "flutter_window.h"

#include <optional>
#include <debugapi.h>
#include "flutter/generated_plugin_registrant.h"

FlutterWindow::FlutterWindow(const flutter::DartProject &project)
    : project_(project) {}

FlutterWindow::~FlutterWindow() {}

bool FlutterWindow::OnCreate()
{
  if (!Win32Window::OnCreate())
  {
    return false;
  }

  RECT frame = GetClientArea();

  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  if (!flutter_controller_->engine() || !flutter_controller_->view())
  {
    return false;
  }
  RegisterPlugins(flutter_controller_->engine());

  // Initialize the method channel
  channel_ = std::make_unique<flutter::MethodChannel<>>(
      flutter_controller_->engine()->messenger(),
      "red.hiro/mouseBackButton",
      &flutter::StandardMethodCodec::GetInstance());

  SetChildContent(flutter_controller_->view()->GetNativeWindow());

  flutter_controller_->engine()->SetNextFrameCallback([&]()
                                                      { this->Show(); });

  flutter_controller_->ForceRedraw();

  return true;
}

void FlutterWindow::OnDestroy()
{
  if (flutter_controller_)
  {
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept
{
  if (flutter_controller_)
  {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
    if (result)
    {
      return *result;
    }
  }

  // SendDebugMessage("MessageHandler: " + std::to_string(message));
  switch (message)
  {
  case WM_FONTCHANGE:
    flutter_controller_->engine()->ReloadSystemFonts();
    break;

  case WM_PARENTNOTIFY:
    WORD xbutton = HIWORD(wparam);
    if (xbutton == XBUTTON1)
    {
      SendBackButtonPressedEvent();
      return TRUE;
    }
    break;
  }

  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}

void FlutterWindow::SendBackButtonPressedEvent()
{
  if (channel_)
  {
    channel_->InvokeMethod("onBackButtonPressed", nullptr);
  }
}

void FlutterWindow::SendDebugMessage(const std::string &message)
{
  if (channel_)
  {
    channel_->InvokeMethod("onDebugMessage", std::make_unique<flutter::EncodableValue>(message));
  }
}
