using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayerController : MonoBehaviour {
	private Rigidbody rb;
	public float speed = 5f;
	public float jump_speed = 0.1f;
	public Text textWin;
	public int count=0;
	public bool hit=false;
	public Text texthit;
	public BoxCollider bc;
	public DoorScript ds;
	public GameObject door;
	public GameObject doorOpened;
	public bool endgame = false;

	// Use this for initialization
	void Start () {
		rb = GetComponent<Rigidbody> ();
		door = GameObject.FindWithTag ("Door");
		doorOpened = GameObject.FindWithTag ("DoorOpened");
		doorOpened.gameObject.SetActive (false);
	}
	
	// Update is called once per frame
	void Update () {

			float moveHorizontal = Input.GetAxis ("Horizontal");
			float moveVertical = Input.GetAxis ("Vertical");
			Vector3 movement = new Vector3 (moveHorizontal, 0.0f, moveVertical);

			if (gameObject.transform.position.y < 1.5 && Input.GetKeyDown (KeyCode.Space)) {
				rb.AddForce (Vector3.up * jump_speed, ForceMode.Impulse);
			}
			if (Input.GetKey (KeyCode.LeftShift)) {
				speed = 200f;
			}
			if (Input.GetKeyUp (KeyCode.LeftShift)) {
				speed = 5f;
			}
			if (hit && Input.GetKeyDown (KeyCode.E)) {
				door.gameObject.SetActive (false);
				doorOpened.gameObject.SetActive (true);
				textWin.text = "remove";
			}
			if (!hit) {
				door.gameObject.SetActive (true);
				doorOpened.gameObject.SetActive (false);
			}
			
			rb.AddForce (movement * speed);
	}
	void OnTriggerEnter(Collider other)
	{
		if (other.gameObject.tag == "Goal") {
			other.gameObject.SetActive (false);
			textWin.text = "Win";
			endgame = true;
			Application.LoadLevel (Application.loadedLevel);


		}

	}
	void OnCollisionEnter(Collision other)
	{
		if (other.gameObject.tag == "DoorGround") {
			hit = true;
			texthit.text = "Hit";
		}
		if (other.gameObject.tag == "enermy") {
			endgame = true;
			textWin.text = "Lose";
			Application.LoadLevel (Application.loadedLevel);
		}

	}
	void OnCollisionExit(Collision other)
	{
		if (other.gameObject.tag == "DoorGround")
			hit = false;
		
	}

}
