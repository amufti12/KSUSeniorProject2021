package com.amazonaws.samples;

import java.util.HashMap;
import java.util.Map;
import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDB;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClientBuilder;
import com.amazonaws.services.dynamodbv2.model.AttributeDefinition;
import com.amazonaws.services.dynamodbv2.model.AttributeValue;
import com.amazonaws.services.dynamodbv2.model.ComparisonOperator;
import com.amazonaws.services.dynamodbv2.model.Condition;
import com.amazonaws.services.dynamodbv2.model.CreateTableRequest;
import com.amazonaws.services.dynamodbv2.model.DescribeTableRequest;
import com.amazonaws.services.dynamodbv2.model.KeySchemaElement;
import com.amazonaws.services.dynamodbv2.model.KeyType;
import com.amazonaws.services.dynamodbv2.model.ProvisionedThroughput;
import com.amazonaws.services.dynamodbv2.model.PutItemRequest;
import com.amazonaws.services.dynamodbv2.model.PutItemResult;
import com.amazonaws.services.dynamodbv2.model.ScalarAttributeType;
import com.amazonaws.services.dynamodbv2.model.ScanRequest;
import com.amazonaws.services.dynamodbv2.model.ScanResult;
import com.amazonaws.services.dynamodbv2.model.TableDescription;
import com.amazonaws.services.dynamodbv2.util.TableUtils;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.document.DeleteItemOutcome;
import com.amazonaws.services.dynamodbv2.document.DynamoDB;
import com.amazonaws.services.dynamodbv2.document.Item;
import com.amazonaws.services.dynamodbv2.document.Table;
import com.amazonaws.auth.profile.ProfilesConfigFile;
import com.amazonaws.services.dynamodbv2.document.UpdateItemOutcome;
import com.amazonaws.services.dynamodbv2.document.spec.DeleteItemSpec;
import com.amazonaws.services.dynamodbv2.document.spec.UpdateItemSpec;
import com.amazonaws.services.dynamodbv2.document.utils.NameMap;
import com.amazonaws.services.dynamodbv2.document.utils.ValueMap;
import com.amazonaws.services.dynamodbv2.model.ReturnValue;
//import com.google.gson.*;

public class ClericDb {
	//creates the connection to Dynamo
	static AmazonDynamoDB dynamo;
	
	//C:\Users\Aydan Mufti\.aws\credentials
	private static void connect() {
//		ProfileCredentialsProvider credentialsProvider = new ProfileCredentialsProvider();
//        try {
//            credentialsProvider.getCredentials();
//        } catch (Exception e) {
//            throw new AmazonClientException(
//                    "Cannot load the AWS Credentials",e);
//        }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//		ProfilesConfigFile configFile = new ProfilesConfigFile("/.aws/credentials");
//		
//		ProfileCredentialsProvider credentialsProvider = new ProfileCredentialsProvider(configFile, null);
//        try {
//            credentialsProvider.getCredentials();
//        } catch (Exception e) {
//            throw new AmazonClientException(
//                    "Cannot load the AWS Credentials",e);
//        }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////			
		BasicAWSCredentials awsCreds = new BasicAWSCredentials("accesskey","secretthing");
		
		
		
		
        dynamo = AmazonDynamoDBClientBuilder.standard()
            .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
            .withRegion("us-east-1")
            .build();
        
		//dynamo = new DynamoDB(new AmazonDynamoDBClient(new ProfileCredentialsProvider())); 
	}
	
	//returns the number the id of a record that's about to be added
	public static int calcItemID(String tablename) {
		ScanRequest request = new ScanRequest().withTableName(tablename);
		ScanResult count = dynamo.scan(request);
		return count.getCount()+1;
	}
	
	//Adds an item to the specialty table
	public static void addSpecialtyItem(String description) {
		String tablename = "Specialty";
		Map<String, AttributeValue> item = new HashMap<String,AttributeValue>();
		int id = calcItemID(tablename);
		item.put("specialID", new AttributeValue().withN(Integer.toString(id)));
		item.put("description", new AttributeValue(description));
		PutItemRequest putItemRequest = new PutItemRequest(tablename, item);
        PutItemResult putItemResult = dynamo.putItem(putItemRequest);
        System.out.println("Result: " + putItemResult);
	}
	
	//retrieves a specialty item from the specialty table
	//currently does not work with ints looking into that
	public static ScanResult getSpecialtyItems(String value,String condition) {
		ScanRequest request;
		HashMap<String,AttributeValue> expression = new HashMap<String,AttributeValue>();
		expression.put(":value", new AttributeValue().withS(value));
		request = new ScanRequest()
				.withTableName("Specialty")
				.withFilterExpression(condition)
				.withProjectionExpression("description")
				.withExpressionAttributeValues(expression);
		ScanResult scanresult = dynamo.scan(request);
		return scanresult;
	}
	
	public static ScanResult getSpecialtyItems() {
		ScanRequest request = new ScanRequest()
				.withTableName("Specialty");
		ScanResult scanresult = dynamo.scan(request);
		return scanresult;
	}
	
	//Adds an item to the patient table
	public static void addPatientItem(String username, String password, 
			String address, String firstName, String lastName,int doctorID,String sex,
			String DOB) {
		String tablename = "Patient";
		Map<String, AttributeValue> item = new HashMap<String,AttributeValue>();
		int id = calcItemID(tablename);
		item.put("patientID", new AttributeValue().withN(Integer.toString(id)));
		item.put("username", new AttributeValue(username));
		item.put("password", new AttributeValue(password));
		item.put("address", new AttributeValue(address));
		item.put("firstName", new AttributeValue(firstName));
		item.put("lastName", new AttributeValue(lastName));
		item.put("doctorID", new AttributeValue().withN(Integer.toString(doctorID)));
		item.put("sex", new AttributeValue(sex));
		item.put("dateOfBirth", new AttributeValue(DOB));
		PutItemRequest putItemRequest = new PutItemRequest(tablename, item);
        PutItemResult putItemResult = dynamo.putItem(putItemRequest);
        System.out.println("Result: " + putItemResult);
	}
	
	public static boolean patientLogin(String username, String password) {
		ScanResult item = getPatientItems(username,"username = :value");
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
	
	
	//Adds an item to the Doctor table
		public static void addDoctorItem(String username, String password, 
				String firstName, String lastName,int specialID) {
			String tablename = "Doctor";
			Map<String, AttributeValue> item = new HashMap<String,AttributeValue>();
			int id = calcItemID(tablename);
			item.put("doctorID", new AttributeValue().withN(Integer.toString(id)));
			item.put("username", new AttributeValue(username));
			item.put("password", new AttributeValue(password));
			item.put("specialID", new AttributeValue().withN(Integer.toString(specialID)));
			item.put("firstName", new AttributeValue(firstName));
			item.put("lastName", new AttributeValue(lastName));
			
			PutItemRequest putItemRequest = new PutItemRequest(tablename, item);
	        PutItemResult putItemResult = dynamo.putItem(putItemRequest);
	        System.out.println("Result: " + putItemResult);
		}
		
		//retrieves a doctor item from the doctor table
		public static ScanResult getDoctorItems(String value,String condition) {
			ScanRequest request;
			HashMap<String,AttributeValue> expression = new HashMap<String,AttributeValue>();
			expression.put(":value", new AttributeValue().withS(value));
			request = new ScanRequest()
					.withTableName("Doctor")
					.withFilterExpression(condition)
					.withExpressionAttributeValues(expression);
			ScanResult scanresult = dynamo.scan(request);
			return scanresult;
		}
	
		//retrieves all doctor items
		public static ScanResult getDoctorItems() {
			ScanRequest request = new ScanRequest()
					.withTableName("Doctor");
			ScanResult scanresult = dynamo.scan(request);
			return scanresult;
		}
	
		public static boolean doctorLogin(String username, String password) {
			ScanResult item = getDoctorItems(username,"username = :value");
			return item.getItems().get(0).get("password").getS().equals(password);
		}
		
	//just used for testing purposes
	 public static void main(String[] args){
		 connect();
		 //Testing purposes
		 //addSpecialtyItem("TestSpecialty");
		 System.out.println(getSpecialtyItems("TestSpecialty","description = :value"));
		 System.out.println(getSpecialtyItems());
		 //working to see if there is a way to generalize where one method can query
		 //almost anything from a table
		 //still in progress
		 //addPatientItem("jdoe1","password","123 Test Street", "John", "Doe",1,"Male","02/11/1991");
		 System.out.println(getPatientItems("John","firstName = :value"));
		 //addDoctorItem("delorean","88MPH","Emmett","Brown",1);
		 System.out.println(getDoctorItems("Emmett","firstName=:value"));
		 patientLogin("jdoe1","password");
		 System.out.println(patientLogin("jdoe1","password"));
		 dynamo.shutdown();
		 
	}
}