# Update for 2000 file diff target
# Explore: explore_0158
# Auto-generated LookML Explore File

include: "/views/domain_25/view_00475.view.lkml"
include: "/views/domain_27/view_00477.view.lkml"
include: "/views/domain_28/view_00478.view.lkml"
include: "/views/domain_29/view_00479.view.lkml"

explore: explore_0158 {
  label: "Explore Explore 0158"
  description: "Comprehensive analytics explore joining base view_00475 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00475
  
  always_filter: {
    filters: [view_00475.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00475.created_at_date: "7 days"]
    unless: [view_00475.id, view_00475.status]
  }

  join: view_00477 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00475.user_id} = ${view_00477.id} ;;
    required_joins: []
  }

  join: view_00478 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00475.account_id} = ${view_00478.account_id} ;;
    required_joins: [view_00477]
  }

  join: view_00479 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00475.category} = ${view_00479.category} ;;
  }

  access_filter: {
    field: view_00475.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00475.is_deleted} = false ;;
}
