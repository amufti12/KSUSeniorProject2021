package com.example.restservice;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDB;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClientBuilder;
import com.amazonaws.services.dynamodbv2.model.AttributeValue;
import com.amazonaws.services.dynamodbv2.model.ScanRequest;
import com.amazonaws.services.dynamodbv2.model.ScanResult;

import java.util.HashMap;

public class ValidateUser {

    private final long id;
    private final boolean successfulLogin;
    //private final String content;
    static AmazonDynamoDB dynamo;
    BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIA3VQDHWSMN3ELTXMF","HY/JbtFB231WSjq6EdzrZySMEm2ipQkfhsAPyXkL");
    //dynamo = new DynamoDB(new AmazonDynamoDBClient(new ProfileCredentialsProvider()));

    public ValidateUser(long id, String username, String password) {
        this.id = id;
        //this.content = content;
        dynamo = AmazonDynamoDBClientBuilder.standard()
                .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
                .withRegion("us-east-1")
                .build();
        this.successfulLogin = patientLogin(username, password);
    }

    public long getId() {
        return id;
    }

    public boolean getSuccessfulLogin() {
        return successfulLogin;
    }

    public static boolean patientLogin(String username, String password) {
        ScanResult item = getPatientItems(username,"username = :value");
        System.out.println("Too bad it's good " + item.getItems().get(0).get("password").getS().equals(password));
        return item.getItems().get(0).get("password").getS().equals(password);

    }

    //retrieves a patient item from the Patient table
    public static ScanResult getPatientItems(String value,String condition) {
        HashMap<String,AttributeValue> expression = new HashMap<String,AttributeValue>();
        expression.put(":value", new AttributeValue().withS(value));
        ScanRequest request = new ScanRequest()
                .withTableName("Patient")
                .withFilterExpression(condition)
                .withExpressionAttributeValues(expression);
        ScanResult scanresult = dynamo.scan(request);
        return  scanresult;
    }

    //retrieves all patient items
    public static ScanResult getPatientItems() {
        ScanRequest request = new ScanRequest()
                .withTableName("Doctor");
        ScanResult scanresult = dynamo.scan(request);
        return scanresult;
    }
}
