# Explore: explore_1536
# Auto-generated LookML Explore File

include: "/views/domain_09/view_04609.view.lkml"
include: "/views/domain_11/view_04611.view.lkml"
include: "/views/domain_12/view_04612.view.lkml"
include: "/views/domain_13/view_04613.view.lkml"

explore: explore_1536 {
  label: "Explore Explore 1536"
  description: "Comprehensive analytics explore joining base view_04609 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04609
  
  always_filter: {
    filters: [view_04609.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04609.created_at_date: "7 days"]
    unless: [view_04609.id, view_04609.status]
  }

  join: view_04611 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04609.user_id} = ${view_04611.id} ;;
    required_joins: []
  }

  join: view_04612 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04609.account_id} = ${view_04612.account_id} ;;
    required_joins: [view_04611]
  }

  join: view_04613 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04609.category} = ${view_04613.category} ;;
  }

  access_filter: {
    field: view_04609.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04609.is_deleted} = false ;;
}
