# Update for 2000 file diff target
# Explore: explore_3190
# Auto-generated LookML Explore File

include: "/views/domain_21/view_09571.view.lkml"
include: "/views/domain_23/view_09573.view.lkml"
include: "/views/domain_24/view_09574.view.lkml"
include: "/views/domain_25/view_09575.view.lkml"

explore: explore_3190 {
  label: "Explore Explore 3190"
  description: "Comprehensive analytics explore joining base view_09571 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09571
  
  always_filter: {
    filters: [view_09571.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09571.created_at_date: "7 days"]
    unless: [view_09571.id, view_09571.status]
  }

  join: view_09573 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09571.user_id} = ${view_09573.id} ;;
    required_joins: []
  }

  join: view_09574 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09571.account_id} = ${view_09574.account_id} ;;
    required_joins: [view_09573]
  }

  join: view_09575 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09571.category} = ${view_09575.category} ;;
  }

  access_filter: {
    field: view_09571.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09571.is_deleted} = false ;;
}
