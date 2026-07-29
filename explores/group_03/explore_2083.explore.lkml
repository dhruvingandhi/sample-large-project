# Explore: explore_2083
# Auto-generated LookML Explore File

include: "/views/domain_50/view_06250.view.lkml"
include: "/views/domain_02/view_06252.view.lkml"
include: "/views/domain_03/view_06253.view.lkml"
include: "/views/domain_04/view_06254.view.lkml"

explore: explore_2083 {
  label: "Explore Explore 2083"
  description: "Comprehensive analytics explore joining base view_06250 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06250
  
  always_filter: {
    filters: [view_06250.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06250.created_at_date: "7 days"]
    unless: [view_06250.id, view_06250.status]
  }

  join: view_06252 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06250.user_id} = ${view_06252.id} ;;
    required_joins: []
  }

  join: view_06253 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06250.account_id} = ${view_06253.account_id} ;;
    required_joins: [view_06252]
  }

  join: view_06254 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06250.category} = ${view_06254.category} ;;
  }

  access_filter: {
    field: view_06250.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06250.is_deleted} = false ;;
}
