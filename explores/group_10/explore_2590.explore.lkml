# Explore: explore_2590
# Auto-generated LookML Explore File

include: "/views/domain_21/view_07771.view.lkml"
include: "/views/domain_23/view_07773.view.lkml"
include: "/views/domain_24/view_07774.view.lkml"
include: "/views/domain_25/view_07775.view.lkml"

explore: explore_2590 {
  label: "Explore Explore 2590"
  description: "Comprehensive analytics explore joining base view_07771 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07771
  
  always_filter: {
    filters: [view_07771.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07771.created_at_date: "7 days"]
    unless: [view_07771.id, view_07771.status]
  }

  join: view_07773 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07771.user_id} = ${view_07773.id} ;;
    required_joins: []
  }

  join: view_07774 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07771.account_id} = ${view_07774.account_id} ;;
    required_joins: [view_07773]
  }

  join: view_07775 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07771.category} = ${view_07775.category} ;;
  }

  access_filter: {
    field: view_07771.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07771.is_deleted} = false ;;
}
