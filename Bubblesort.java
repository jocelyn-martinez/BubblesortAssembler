package algorithms;

public class BS {

	static void bubbleSort(int arr[]) { 
		int n = arr.length; 
		for (int i = 0; i < n-1; i++) 
			for (int j = 0; j < n-i-1; j++) 
				if (arr[j] > arr[j+1]) { 
					// swap arr[j+1] and arr[i] 
					int temp = arr[j]; 
					arr[j] = arr[j+1]; 
					arr[j+1] = temp; 
				} 
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int x [] = {4, 6, 10, 5, 7};
		bubbleSort(x);
		for(int i = 0; i < x.length; i++) {
			System.out.println(x[i]);
		}
	}
}
