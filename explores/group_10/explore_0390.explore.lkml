# Explore: explore_0390
# Auto-generated LookML Explore File

include: "/views/domain_21/view_01171.view.lkml"
include: "/views/domain_23/view_01173.view.lkml"
include: "/views/domain_24/view_01174.view.lkml"
include: "/views/domain_25/view_01175.view.lkml"

explore: explore_0390 {
  label: "Explore Explore 0390"
  description: "Comprehensive analytics explore joining base view_01171 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01171
  
  always_filter: {
    filters: [view_01171.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01171.created_at_date: "7 days"]
    unless: [view_01171.id, view_01171.status]
  }

  join: view_01173 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01171.user_id} = ${view_01173.id} ;;
    required_joins: []
  }

  join: view_01174 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01171.account_id} = ${view_01174.account_id} ;;
    required_joins: [view_01173]
  }

  join: view_01175 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01171.category} = ${view_01175.category} ;;
  }

  access_filter: {
    field: view_01171.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01171.is_deleted} = false ;;
}
