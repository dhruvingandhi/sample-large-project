# Update for 2000 file diff target
# Explore: explore_2500
# Auto-generated LookML Explore File

include: "/views/domain_01/view_07501.view.lkml"
include: "/views/domain_03/view_07503.view.lkml"
include: "/views/domain_04/view_07504.view.lkml"
include: "/views/domain_05/view_07505.view.lkml"

explore: explore_2500 {
  label: "Explore Explore 2500"
  description: "Comprehensive analytics explore joining base view_07501 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07501
  
  always_filter: {
    filters: [view_07501.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07501.created_at_date: "7 days"]
    unless: [view_07501.id, view_07501.status]
  }

  join: view_07503 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07501.user_id} = ${view_07503.id} ;;
    required_joins: []
  }

  join: view_07504 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07501.account_id} = ${view_07504.account_id} ;;
    required_joins: [view_07503]
  }

  join: view_07505 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07501.category} = ${view_07505.category} ;;
  }

  access_filter: {
    field: view_07501.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07501.is_deleted} = false ;;
}
