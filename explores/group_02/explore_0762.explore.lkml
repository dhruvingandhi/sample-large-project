# Update for 500 file diff target
# Explore: explore_0762
# Auto-generated LookML Explore File

include: "/views/domain_37/view_02287.view.lkml"
include: "/views/domain_39/view_02289.view.lkml"
include: "/views/domain_40/view_02290.view.lkml"
include: "/views/domain_41/view_02291.view.lkml"

explore: explore_0762 {
  label: "Explore Explore 0762"
  description: "Comprehensive analytics explore joining base view_02287 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02287
  
  always_filter: {
    filters: [view_02287.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02287.created_at_date: "7 days"]
    unless: [view_02287.id, view_02287.status]
  }

  join: view_02289 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02287.user_id} = ${view_02289.id} ;;
    required_joins: []
  }

  join: view_02290 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02287.account_id} = ${view_02290.account_id} ;;
    required_joins: [view_02289]
  }

  join: view_02291 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02287.category} = ${view_02291.category} ;;
  }

  access_filter: {
    field: view_02287.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02287.is_deleted} = false ;;
}
