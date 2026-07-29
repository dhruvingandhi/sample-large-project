# Explore: explore_3811
# Auto-generated LookML Explore File

include: "/views/domain_34/view_11434.view.lkml"
include: "/views/domain_36/view_11436.view.lkml"
include: "/views/domain_37/view_11437.view.lkml"
include: "/views/domain_38/view_11438.view.lkml"

explore: explore_3811 {
  label: "Explore Explore 3811"
  description: "Comprehensive analytics explore joining base view_11434 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11434
  
  always_filter: {
    filters: [view_11434.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11434.created_at_date: "7 days"]
    unless: [view_11434.id, view_11434.status]
  }

  join: view_11436 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11434.user_id} = ${view_11436.id} ;;
    required_joins: []
  }

  join: view_11437 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11434.account_id} = ${view_11437.account_id} ;;
    required_joins: [view_11436]
  }

  join: view_11438 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11434.category} = ${view_11438.category} ;;
  }

  access_filter: {
    field: view_11434.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11434.is_deleted} = false ;;
}
