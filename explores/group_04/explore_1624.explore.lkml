# Explore: explore_1624
# Auto-generated LookML Explore File

include: "/views/domain_23/view_04873.view.lkml"
include: "/views/domain_25/view_04875.view.lkml"
include: "/views/domain_26/view_04876.view.lkml"
include: "/views/domain_27/view_04877.view.lkml"

explore: explore_1624 {
  label: "Explore Explore 1624"
  description: "Comprehensive analytics explore joining base view_04873 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04873
  
  always_filter: {
    filters: [view_04873.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04873.created_at_date: "7 days"]
    unless: [view_04873.id, view_04873.status]
  }

  join: view_04875 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04873.user_id} = ${view_04875.id} ;;
    required_joins: []
  }

  join: view_04876 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04873.account_id} = ${view_04876.account_id} ;;
    required_joins: [view_04875]
  }

  join: view_04877 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04873.category} = ${view_04877.category} ;;
  }

  access_filter: {
    field: view_04873.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04873.is_deleted} = false ;;
}
