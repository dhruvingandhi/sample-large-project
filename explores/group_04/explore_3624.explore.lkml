# Explore: explore_3624
# Auto-generated LookML Explore File

include: "/views/domain_23/view_10873.view.lkml"
include: "/views/domain_25/view_10875.view.lkml"
include: "/views/domain_26/view_10876.view.lkml"
include: "/views/domain_27/view_10877.view.lkml"

explore: explore_3624 {
  label: "Explore Explore 3624"
  description: "Comprehensive analytics explore joining base view_10873 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10873
  
  always_filter: {
    filters: [view_10873.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10873.created_at_date: "7 days"]
    unless: [view_10873.id, view_10873.status]
  }

  join: view_10875 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10873.user_id} = ${view_10875.id} ;;
    required_joins: []
  }

  join: view_10876 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10873.account_id} = ${view_10876.account_id} ;;
    required_joins: [view_10875]
  }

  join: view_10877 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10873.category} = ${view_10877.category} ;;
  }

  access_filter: {
    field: view_10873.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10873.is_deleted} = false ;;
}
