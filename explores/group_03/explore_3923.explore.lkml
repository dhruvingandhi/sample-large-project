# Explore: explore_3923
# Auto-generated LookML Explore File

include: "/views/domain_20/view_11770.view.lkml"
include: "/views/domain_22/view_11772.view.lkml"
include: "/views/domain_23/view_11773.view.lkml"
include: "/views/domain_24/view_11774.view.lkml"

explore: explore_3923 {
  label: "Explore Explore 3923"
  description: "Comprehensive analytics explore joining base view_11770 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11770
  
  always_filter: {
    filters: [view_11770.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11770.created_at_date: "7 days"]
    unless: [view_11770.id, view_11770.status]
  }

  join: view_11772 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11770.user_id} = ${view_11772.id} ;;
    required_joins: []
  }

  join: view_11773 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11770.account_id} = ${view_11773.account_id} ;;
    required_joins: [view_11772]
  }

  join: view_11774 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11770.category} = ${view_11774.category} ;;
  }

  access_filter: {
    field: view_11770.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11770.is_deleted} = false ;;
}
