# Update for 2000 file diff target
# Explore: explore_3759
# Auto-generated LookML Explore File

include: "/views/domain_28/view_11278.view.lkml"
include: "/views/domain_30/view_11280.view.lkml"
include: "/views/domain_31/view_11281.view.lkml"
include: "/views/domain_32/view_11282.view.lkml"

explore: explore_3759 {
  label: "Explore Explore 3759"
  description: "Comprehensive analytics explore joining base view_11278 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11278
  
  always_filter: {
    filters: [view_11278.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11278.created_at_date: "7 days"]
    unless: [view_11278.id, view_11278.status]
  }

  join: view_11280 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11278.user_id} = ${view_11280.id} ;;
    required_joins: []
  }

  join: view_11281 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11278.account_id} = ${view_11281.account_id} ;;
    required_joins: [view_11280]
  }

  join: view_11282 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11278.category} = ${view_11282.category} ;;
  }

  access_filter: {
    field: view_11278.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11278.is_deleted} = false ;;
}
