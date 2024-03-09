require('dotenv').config();
const AWS = require('aws-sdk');

AWS.config.update({ region: process.env.REGION }); 
const cognito = new AWS.CognitoIdentityServiceProvider();

const userPoolId = process.env.USER_POOL_ID; 
const clientId = process.env.CLIENT_ID; 

// Function to sign up a user with phone number and verify using SMS
async function signUpUser(req,res) {
    const { email, password } = req.body;
  
  const params = {
    ClientId: clientId,
    Password: password,
    Username: email,
  };
  
  cognito.signUp({
    ClientId: params.ClientId,
    Username: params.Username,
    Password: params.Password,
  }, (err, data) => {
    if (err) {
      console.error('Error registering user:', err);
      res.status(500).json({ error: 'Error registering user' });
    } else {
      console.log('User registered successfully:', data);
      res.json({ message: 'User registered successfully' });
    }
  });
}

async function verifyUser(req,res){
    const { email, code } = req.body;
  
    const params = {
      ClientId: clientId,
      ConfirmationCode: code,
      Username: email,
    };
    
    cognito.confirmSignUp(params, (err, data) => {
      if (err) {
        console.error('Error verifying user:', err);
        res.status(500).json({ error: 'Error verifying user' });
      } else {
        console.log('User verified successfully:', data);
        res.json({ message: 'User verified successfully' });
      }
    });
}

async function signInUser(req,res){
    const { email, password } = req.body;
  
  const params = {
    AuthFlow: 'USER_PASSWORD_AUTH',
    ClientId: clientId,
    AuthParameters: {
      USERNAME: email,
      PASSWORD: password,
    },
  };
  
  cognito.initiateAuth(params, (err, data) => {
    if (err) {
      console.error('Error signing in user:', err);
      res.status(500).json({ error: 'Error signing in user' });
    } else {
      console.log('User signed in successfully:', data);
      res.json({ message: 'User signed in successfully' });
    }
  });
}

module.exports = {
    signUpUser,
    verifyUser,
    signInUser
}