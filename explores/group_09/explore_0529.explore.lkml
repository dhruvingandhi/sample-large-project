# Explore: explore_0529
# Auto-generated LookML Explore File

include: "/views/domain_38/view_01588.view.lkml"
include: "/views/domain_40/view_01590.view.lkml"
include: "/views/domain_41/view_01591.view.lkml"
include: "/views/domain_42/view_01592.view.lkml"

explore: explore_0529 {
  label: "Explore Explore 0529"
  description: "Comprehensive analytics explore joining base view_01588 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01588
  
  always_filter: {
    filters: [view_01588.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01588.created_at_date: "7 days"]
    unless: [view_01588.id, view_01588.status]
  }

  join: view_01590 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01588.user_id} = ${view_01590.id} ;;
    required_joins: []
  }

  join: view_01591 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01588.account_id} = ${view_01591.account_id} ;;
    required_joins: [view_01590]
  }

  join: view_01592 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01588.category} = ${view_01592.category} ;;
  }

  access_filter: {
    field: view_01588.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01588.is_deleted} = false ;;
}
