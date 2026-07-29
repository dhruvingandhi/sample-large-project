# Explore: explore_3038
# Auto-generated LookML Explore File

include: "/views/domain_15/view_09115.view.lkml"
include: "/views/domain_17/view_09117.view.lkml"
include: "/views/domain_18/view_09118.view.lkml"
include: "/views/domain_19/view_09119.view.lkml"

explore: explore_3038 {
  label: "Explore Explore 3038"
  description: "Comprehensive analytics explore joining base view_09115 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09115
  
  always_filter: {
    filters: [view_09115.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09115.created_at_date: "7 days"]
    unless: [view_09115.id, view_09115.status]
  }

  join: view_09117 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09115.user_id} = ${view_09117.id} ;;
    required_joins: []
  }

  join: view_09118 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09115.account_id} = ${view_09118.account_id} ;;
    required_joins: [view_09117]
  }

  join: view_09119 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09115.category} = ${view_09119.category} ;;
  }

  access_filter: {
    field: view_09115.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09115.is_deleted} = false ;;
}
