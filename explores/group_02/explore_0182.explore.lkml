# Explore: explore_0182
# Auto-generated LookML Explore File

include: "/views/domain_47/view_00547.view.lkml"
include: "/views/domain_49/view_00549.view.lkml"
include: "/views/domain_50/view_00550.view.lkml"
include: "/views/domain_01/view_00551.view.lkml"

explore: explore_0182 {
  label: "Explore Explore 0182"
  description: "Comprehensive analytics explore joining base view_00547 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00547
  
  always_filter: {
    filters: [view_00547.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00547.created_at_date: "7 days"]
    unless: [view_00547.id, view_00547.status]
  }

  join: view_00549 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00547.user_id} = ${view_00549.id} ;;
    required_joins: []
  }

  join: view_00550 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00547.account_id} = ${view_00550.account_id} ;;
    required_joins: [view_00549]
  }

  join: view_00551 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00547.category} = ${view_00551.category} ;;
  }

  access_filter: {
    field: view_00547.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00547.is_deleted} = false ;;
}
