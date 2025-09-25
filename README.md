git clone https://github.com/flutter/flutter.git -b stable
echo 'export PATH="$PATH:/workspaces/gas-delivery-app/flutter/bin"' >> ~/.bashrc
source ~/.bashrc
flutter doctor
flutter create .