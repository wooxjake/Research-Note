연구노트
=======

### 2019.05.10 (금)
* 노락슨 2가지 모델 test(모델 : 한국체대 -> Mini DTS  / 휠라코리아 -> Ultium™ EMG)
  * 타임 딜레이 : 싱크 모듈(MR3 Synchronization)을 사용하면 지면반력과 가속도계 사이 싱크 차이는 5프레임 미만
                 mini DTS 경우(Sf : 1500Hz) 0.0035s 미만, Ultium의 경우(sf : 2000Hz) : 0.0025 s 미만 (* 5프레임 시간임)
  * 단위 : Mini DTS -> G / Ultium™ -> mG, (* 1G = 1/1000 mG)
 
* 키슬러를 통해 가속도계 테스트 (런닝)
  * 지면반력에 억지로 맞춰 밟으려고 하다 보니 가속도계 값이 20~ 60 G 사이 나옴. 
  * 보통 경골 가속도계 크기 : 5 ~ 10 G
  * 가속도계 자체가 민감한 장비이기 때문에 부자연스러운 동작에는 잘못된 크기가 측정됨. 트레드밀 또는 긴 트렉에서의 달리기가 좋을 듯함. 
 
* 가속도계 방향 확인
  * 테스트 시, 가속도계 방향을 고려하지 않고 부착 시킴 
    -> 사후 작업으로 방향을 맞출 순 있지만, 잘못된 방향으로 수정할 수 있기 때문에 테스트 처음부터 방향을 잘 고려하여 부착시킬 필요성이 있음. 
    
* 데이터 패턴 및 차단주파수 확인
  * QTM 을통해 이벤트를 잡고, 가속도계를 동조시킴 -> 이후, 가속도계의 패턴, 크기 등 비교 -> 패턴 일치
  * 방향을 고려하지 않고 부착했기 때문에 x,y,z 축이 확실치 않아 선행연구와 비교 
    (Mario A. Lafortune(1991) :Three-dimensional acceleration of the tibia during walking and running)
  * psd 99%를 통해 차단 주파수 찾음 약 20 ~ 60Hz
  * 선행연구에서도 psd 99% 시, 60Hz 이하라고 보고함. 선행연구에서는 2차 버터워스 저역통과 필터 사용
    (Ewald M. Hennig and Mario A.Lafortune(1991) : Relationships between ground reaction force and tibial bone acceleration parameters.)
 
* heel contact - toe off 시점 확인 
  * 가속도계 z축과  지면반력 z축을 통해 heel contact 과 toe off 찾음. -> 지면반력 임팩트 피크와, 가속도계 첫 피크 시점으로 찾음. 
   (Ewald M. Hennig and Mario A.Lafortune(1991) : Relationships between ground reaction force and tibial bone acceleration parameters.)
  * 지면반력 임팩트 시점과 가속도계 첫 피크 시점은 약 10프레임 미만으로 차이가 남. 
    mini DTS 경우(Sf : 1500Hz) 0.007s 미만, Ultium의 경우(sf : 2000Hz) : 0.005s 미만
   
* 결론
  * 가속도계 선택 : mini DTS 와 Ultium 두 버전의 가속도계는 데이터의 패턴, 크기 등 다를 것이 없지만, mini DTS가 단위 변환이 필요 없으며, 가속도계 전용이라는 점에서 사용하는 것이 좋을 것으로 판단. 
  * 원위부 및 근위부 경골 부착 위치 : 신발에 따른 충격을 보기 위함이므로 신발에서 먼 근위부보단 가까운 원위부에 부착하는 것이 좋을것으로 판단.
 
 

### 2019.04.17 (수)
* 노락슨 가속도계(신모델) -경골 원위부 및 근위부 부착에 따른 데이터 차이 비교
* 노락슨 가속도계와 트레드밀 GRF 동조 - 무선으로 인한 프레임 차이가 얼마나 나는지? 
  * 노락슨 emg와 grf : 약 27프레임 차이, -> 카메라 120 프레임 기준, 2.2초 
  * 노락슨 가속도계와 grf : 약 30프레임 차이 -> 카메라 120프레임 기준, 2.5초 


* 노락슨 프로그램을 통한 가속도계 데이터와 QTM을 통한 가속도계 데이터 비교 : row data or filtering data ?

* 가속도계를 통해 어떤 변수를 알수 있을까?
