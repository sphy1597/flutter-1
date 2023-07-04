# MediAssist - Medication Assistance Service for Visually Impaired Individuals

## Overview

MediAssist is a mobile application designed to assist visually impaired and low-vision individuals in identifying and accessing medication information. The project aims to address the difficulties faced by visually impaired individuals in distinguishing and obtaining information about medications, while improving upon the limitations of existing services such as Braille.

## Features

-   **QR Code**: MediAssist supports the use of existing QR code-based information services. Users can scan the barcodes on medication packages to retrieve detailed information about the medication, including its name and usage instructions. Additionally, MediAssist offers a proprietary QR code system to provide information about prescription medications without packaging or labels.
-   **OCR Text Recognition**: This feature allows users to recognize and read text on medication packages or labels, including the medication name, usage instructions (e.g., morning, afternoon, evening), and other relevant information. The OCR text recognition can also be used for general text recognition purposes beyond medication-related tasks.
-   **Medication Search**: Users can search for medication information by entering the name of the medication. The app will retrieve relevant information, utilizing barcode and image search functionalities where applicable.
-   **Image Search**: Using a trained image classification model on a dataset of oral medication images, MediAssist can distinguish and provide information about medications based on user-captured photos. The image search function is integrated with the medication search for comprehensive information retrieval.
-   **Convenience Features**: MediAssist offers additional convenience features, including medication reminders (alarms), search history, medication interactions, disease information setup, warning messages, and a user guide.

## Technical Information

-   **Development Environment**: Flutter, vsCode
-   **Platforms**: Android, iOS
-   **Languages**: Dart, Python
-   **Server**: AWS, FastAPI

## Team Members

-   Eunyoung Go: [GitHub](https://github.com/favorcat)
-   Jaewoon Sim: [GitHub](https://github.com/jaejae990921)
-   Gyucheol Sim: [GitHub](https://github.com/sphy1597)

## License

This project is licensed under the [MIT License](https://chat.openai.com/path/to/license).

<br>
<br>

# 약리미 - 시각장애인 의약품 복용 보조 서비스

## 개요
 시각장애인들 및 저시력자들은 의약품을 구분하고 정보를 확인하는데 어려움이 있고 점자와 같은 기존의 서비스들의 한계점을 개선하고자 프로젝트를 시작했습니다. 약리미는 의약품 복용을 보조하기 위한 애플리케이션으로 의약품 구분 및 정보 안내를 메인으로 하는서비스입니다.
  

## 기능 및 특징
- **QR**: 기존에 존재하는 QR코드 형태의 정보 제공 서비스를 계속 사용가능하며 약 상자에 존재하는 제품의 바코드를 통해 약 이름과 정보를 검색할 수 있습니다. 또한 약리미의 독자적인 QR코드 시스템을 통해 약 상자나 포장이 없는 처방약에 대한 정보 또한 제공받을 수 있습니다.  
- **OCR 글자인식**: 약 상자와 포장을 통해서 약의 이름과 정보를 확인하거나 약 봉지의 복용 시간 ( 아침, 점심, 저녁 )을 구분하는데 사용하는 기능입니다. 이 밖에도 글자를 인식하는데 사용 가능합니다. 
- **약검색**: 약 이름을 통해 약의 정보를 검색하는 기능으로 바코드 검색, 이미지 검색 등의 기능에서 연계하여 활용됩니다. 사용자가 직접 이름을 입력하여 약을 검색할 수 있습니다.
- **이미지 검색**: 약의 이미지를 통해 약을 구분하고 정보를 제공받는 기능입니다. 학습된 경구약제 이미지셋을 통해 학습한 이미지 분류 모델을 활용하여 약을 사진으로 찍어 구분하고 해당약의 이름을 약검색 기능과 연계하여 정보를 제공합니다. 
- **편의기능**: 알람, 검색기록, 알리저 및 질병 정보 설정, 경고창, 도움말과 같은 기능이 있습니다. 

## 기술적 정보
- **개발환경**: Flutter, vsCode
- **플랫폼**: Android, IOS
- **언어**: dart, Python
- **서버**: AWS, FastAPI


## 팀원  
- 고은영 : https://github.com/favorcat
- 심재운 : https://github.com/jaejae990921
- 심규철 : https://github.com/sphy1597

## 라이선스
이 프로젝트는 [MIT 라이선스](/path/to/license)를 따릅니다.
