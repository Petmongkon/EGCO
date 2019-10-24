using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class enermyScript : MonoBehaviour {
	private Rigidbody rb;
	public float ms=10000;
	public float x=10;
	// Use this for initialization
	void Start () {
		rb = GetComponent<Rigidbody> ();
	}
	
	// Update is called once per frame
	void Update () {
//		Vector3 move = new Vector3 (x, 0, 0);
//		rb.AddForce (move*ms*Time.deltaTime);	
		if (x > 1) {
			transform.Translate (Vector3.right * Time.deltaTime);
		} else
			transform.Translate (Vector3.left * Time.deltaTime);
	}

	void OnCollisionEnter(Collision other)
	{
		x = x * -1;
	}
}
