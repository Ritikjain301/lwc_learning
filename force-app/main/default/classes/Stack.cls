public class Stack {
    public List<Student__c> stack = new List<Student__c>();
	
    public void push(Student__c studentList) {
				this.stack.add(studentList);
		}

		public Student__c pop() {
			return this.stack.isEmpty() ? null : this.stack.remove(this.stack.size() - 1);
    		}

		public boolean isEmpty() {
			return this.stack.isEmpty();
		}

		public Student__c peek() {
                    return this.stack[this.stack.size() - 1];
        }
			
				//else	
				//	null;
			
		public Integer size() {
			 return this.stack.size();
		}

	}