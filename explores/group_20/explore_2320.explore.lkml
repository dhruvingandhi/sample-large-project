# Update for 2000 file diff target
# Explore: explore_2320
# Auto-generated LookML Explore File

include: "/views/domain_11/view_06961.view.lkml"
include: "/views/domain_13/view_06963.view.lkml"
include: "/views/domain_14/view_06964.view.lkml"
include: "/views/domain_15/view_06965.view.lkml"

explore: explore_2320 {
  label: "Explore Explore 2320"
  description: "Comprehensive analytics explore joining base view_06961 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06961
  
  always_filter: {
    filters: [view_06961.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06961.created_at_date: "7 days"]
    unless: [view_06961.id, view_06961.status]
  }

  join: view_06963 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06961.user_id} = ${view_06963.id} ;;
    required_joins: []
  }

  join: view_06964 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06961.account_id} = ${view_06964.account_id} ;;
    required_joins: [view_06963]
  }

  join: view_06965 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06961.category} = ${view_06965.category} ;;
  }

  access_filter: {
    field: view_06961.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06961.is_deleted} = false ;;
}
