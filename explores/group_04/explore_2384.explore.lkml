# Explore: explore_2384
# Auto-generated LookML Explore File

include: "/views/domain_03/view_07153.view.lkml"
include: "/views/domain_05/view_07155.view.lkml"
include: "/views/domain_06/view_07156.view.lkml"
include: "/views/domain_07/view_07157.view.lkml"

explore: explore_2384 {
  label: "Explore Explore 2384"
  description: "Comprehensive analytics explore joining base view_07153 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07153
  
  always_filter: {
    filters: [view_07153.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07153.created_at_date: "7 days"]
    unless: [view_07153.id, view_07153.status]
  }

  join: view_07155 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07153.user_id} = ${view_07155.id} ;;
    required_joins: []
  }

  join: view_07156 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07153.account_id} = ${view_07156.account_id} ;;
    required_joins: [view_07155]
  }

  join: view_07157 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07153.category} = ${view_07157.category} ;;
  }

  access_filter: {
    field: view_07153.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07153.is_deleted} = false ;;
}
