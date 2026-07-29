# Explore: explore_0203
# Auto-generated LookML Explore File

include: "/views/domain_10/view_00610.view.lkml"
include: "/views/domain_12/view_00612.view.lkml"
include: "/views/domain_13/view_00613.view.lkml"
include: "/views/domain_14/view_00614.view.lkml"

explore: explore_0203 {
  label: "Explore Explore 0203"
  description: "Comprehensive analytics explore joining base view_00610 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00610
  
  always_filter: {
    filters: [view_00610.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00610.created_at_date: "7 days"]
    unless: [view_00610.id, view_00610.status]
  }

  join: view_00612 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00610.user_id} = ${view_00612.id} ;;
    required_joins: []
  }

  join: view_00613 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00610.account_id} = ${view_00613.account_id} ;;
    required_joins: [view_00612]
  }

  join: view_00614 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00610.category} = ${view_00614.category} ;;
  }

  access_filter: {
    field: view_00610.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00610.is_deleted} = false ;;
}
