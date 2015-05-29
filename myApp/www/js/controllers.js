angular.module('starter.controllers', [])

.controller('DashCtrl', function($scope) {})

.controller('ChatsCtrl', function($scope, Chats) {
  $scope.chats = Chats.all();
  $scope.remove = function(chat) {
    Chats.remove(chat);
  }
})

.controller('ChatDetailCtrl', function($scope, $stateParams, Chats) {
  $scope.chat = Chats.get($stateParams.chatId);
})

.controller('AccountCtrl', function($scope) {
  $scope.settings = {
    enableFriends: true
  };
})

.controller('CardsCtrl', function($scope, $http) {
    // var cardTypes = [
    //     { image: 'https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png', title: 'So much grass #hippster'},
    //     { image: 'img/pic3.png', title: 'Way too much Sand, right?'},
    //     { image: 'img/pic4.png', title: 'Beautiful sky from wherever'},
    // ];

    var cardTypes = [];
    $http.get('http://localhost:3000/get_items/').then(function(resp) {
        cardTypes = resp.data.payload ;
      }, function(err) {
        debugger
        console.error('ERR', err);
        // err.status will contain the status code
      })

 debugger
    $scope.cards = [];
 
    $scope.addCard = function(i) {
        var newCard = cardTypes[Math.floor(Math.random() * cardTypes.length)];
        newCard.id = Math.random();
        $scope.cards.push(angular.extend({}, newCard));
    }
 
    for(var i = 0; i < 3; i++) $scope.addCard();
 
    $scope.cardSwipedLeft = function(index) {
        console.log('Left swipe');
    }
 
    $scope.cardSwipedRight = function(index) {
        console.log('Right swipe');
    }
 
    $scope.cardDestroyed = function(index) {
        $scope.cards.splice(index, 1);
        console.log('Card removed');
    }
})
.controller('LoginCtrl', function($scope, LoginService, $ionicPopup, $state) {
    $scope.data = {};
    $scope.login = function() {
        LoginService.loginUser($scope.data.username, $scope.data.password).success(function(data) {
            $state.go('tab.dash');
        }).error(function(data) {
            var alertPopup = $ionicPopup.alert({
                title: 'Login failed!',
                template: 'Please check your credentials!'
            });
        });
    }
})

.controller('SignUpCtrl', function($scope, $http, $state){
    $scope.data = {};
    $scope.sign_up = function(){
        debugger
      $http.post('http://localhost:3000/sign_up/', $scope.data).success(function(data) {
                debugger
            })
            .error(function(data) {
                $state.go('login');
            });
    };
});
