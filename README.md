# UIPicker

### Общее описание задания
Создать приложение, состоящее из одного экрана (UIViewController), который содержит следующие UI компоненты:
- Логотип;
- Текст приветствия;
- UIPicker выбора языка приложения (Английский, Белорусский, Русский);
- Три кнопки: светлая тема, тёмная тема и авто.

### Требования к приложению:
1. Не использовать Storyboard и Xib. Вся вёрстка происходит программно
2. Реализовать локализацию приложения (Английский, Белорусский, Русский)
3. Поддержать смену темы в приложении (светлая / темная / авто)
4. Кнопки должны менять свой внешний вид в зависимости от состояния (touchUpInside)

### Логика работы
При нажатии на UIPicker пользователю предлагается выбрать язык приложения. Изменение происходит автоматически без перезапуска приложения: меняется текст приветствия. Тема приложения переключается с помощью кнопок (авто - соответствует текущей теме системе).

### Установка
1) В корневом каталоге проекта запустить:
```bash
$ pod install
```
2) Открыть `UIPicker.xcworkspace` файл

### Стек
 - Swift
 - UIKit
 - MVС
 - SnapKit

### Демонстрация работы приложения
<div align="center">
  <video src="https://user-images.githubusercontent.com/69767713/206937312-e16e5d95-59c1-497c-9121-d0c1948b9b5a.mp4"/>
<div/>
