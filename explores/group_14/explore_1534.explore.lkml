# Explore: explore_1534
# Auto-generated LookML Explore File

include: "/views/domain_03/view_04603.view.lkml"
include: "/views/domain_05/view_04605.view.lkml"
include: "/views/domain_06/view_04606.view.lkml"
include: "/views/domain_07/view_04607.view.lkml"

explore: explore_1534 {
  label: "Explore Explore 1534"
  description: "Comprehensive analytics explore joining base view_04603 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04603
  
  always_filter: {
    filters: [view_04603.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04603.created_at_date: "7 days"]
    unless: [view_04603.id, view_04603.status]
  }

  join: view_04605 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04603.user_id} = ${view_04605.id} ;;
    required_joins: []
  }

  join: view_04606 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04603.account_id} = ${view_04606.account_id} ;;
    required_joins: [view_04605]
  }

  join: view_04607 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04603.category} = ${view_04607.category} ;;
  }

  access_filter: {
    field: view_04603.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04603.is_deleted} = false ;;
}
