package com.amazonaws.samples;



import java.util.HashMap;
import java.util.Map;
import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDB;
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



public class ClericDb {
	//creates the connection to Dynamo
	static AmazonDynamoDB dynamo;
	private static void connect() {
		ProfileCredentialsProvider credentialsProvider = new ProfileCredentialsProvider();
        try {
            credentialsProvider.getCredentials();
        } catch (Exception e) {
            throw new AmazonClientException(
                    "Cannot load the AWS Credentials",
                    e);
        }
        dynamo = AmazonDynamoDBClientBuilder.standard()
            .withCredentials(credentialsProvider)
            .withRegion("us-east-1")
            .build();
        
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
		PutItemRequest putItemRequest = new PutItemRequest("Specialty", item);
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
	
	//just used for testing purposes
	 public static void main(String[] args){
		 connect();
		 //Testing purposes
		 addSpecialtyItem("TestSpecialty");
		 System.out.println(getSpecialtyItems("Pediatric","description = :value"));
		 System.out.println(getSpecialtyItems());
		 //working to see if there is a way to generalize where one method can query
		 //almost anything from a table
		 //still in progress
		 //System.out.println(getSpecialtyItems("2","specialID == :value"));
		 dynamo.shutdown();
		 
	}
}
