defmodule Timesheetsspa.JobsTest do
  use Timesheetsspa.DataCase

  alias Timesheetsspa.Jobs

  describe "jobs" do
    alias Timesheetsspa.Jobs.Job

    @valid_attrs %{description: "some description", hours: 42, jobcode: "some jobcode", name: "some name"}
    @update_attrs %{description: "some updated description", hours: 43, jobcode: "some updated jobcode", name: "some updated name"}
    @invalid_attrs %{description: nil, hours: nil, jobcode: nil, name: nil}

    def job_fixture(attrs \\ %{}) do
      {:ok, job} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Jobs.create_job()

      job
    end

    test "list_jobs/0 returns all jobs" do
      job = job_fixture()
      assert Jobs.list_jobs() == [job]
    end

    test "get_job!/1 returns the job with given id" do
      job = job_fixture()
      assert Jobs.get_job!(job.id) == job
    end

    test "create_job/1 with valid data creates a job" do
      assert {:ok, %Job{} = job} = Jobs.create_job(@valid_attrs)
      assert job.description == "some description"
      assert job.hours == 42
      assert job.jobcode == "some jobcode"
      assert job.name == "some name"
    end

    test "create_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Jobs.create_job(@invalid_attrs)
    end

    test "update_job/2 with valid data updates the job" do
      job = job_fixture()
      assert {:ok, %Job{} = job} = Jobs.update_job(job, @update_attrs)
      assert job.description == "some updated description"
      assert job.hours == 43
      assert job.jobcode == "some updated jobcode"
      assert job.name == "some updated name"
    end

    test "update_job/2 with invalid data returns error changeset" do
      job = job_fixture()
      assert {:error, %Ecto.Changeset{}} = Jobs.update_job(job, @invalid_attrs)
      assert job == Jobs.get_job!(job.id)
    end

    test "delete_job/1 deletes the job" do
      job = job_fixture()
      assert {:ok, %Job{}} = Jobs.delete_job(job)
      assert_raise Ecto.NoResultsError, fn -> Jobs.get_job!(job.id) end
    end

    test "change_job/1 returns a job changeset" do
      job = job_fixture()
      assert %Ecto.Changeset{} = Jobs.change_job(job)
    end
  end
end
