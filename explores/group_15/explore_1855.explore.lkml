# Explore: explore_1855
# Auto-generated LookML Explore File

include: "/views/domain_16/view_05566.view.lkml"
include: "/views/domain_18/view_05568.view.lkml"
include: "/views/domain_19/view_05569.view.lkml"
include: "/views/domain_20/view_05570.view.lkml"

explore: explore_1855 {
  label: "Explore Explore 1855"
  description: "Comprehensive analytics explore joining base view_05566 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05566
  
  always_filter: {
    filters: [view_05566.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05566.created_at_date: "7 days"]
    unless: [view_05566.id, view_05566.status]
  }

  join: view_05568 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05566.user_id} = ${view_05568.id} ;;
    required_joins: []
  }

  join: view_05569 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05566.account_id} = ${view_05569.account_id} ;;
    required_joins: [view_05568]
  }

  join: view_05570 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05566.category} = ${view_05570.category} ;;
  }

  access_filter: {
    field: view_05566.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05566.is_deleted} = false ;;
}
