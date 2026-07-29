# Explore: explore_0484
# Auto-generated LookML Explore File

include: "/views/domain_03/view_01453.view.lkml"
include: "/views/domain_05/view_01455.view.lkml"
include: "/views/domain_06/view_01456.view.lkml"
include: "/views/domain_07/view_01457.view.lkml"

explore: explore_0484 {
  label: "Explore Explore 0484"
  description: "Comprehensive analytics explore joining base view_01453 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01453
  
  always_filter: {
    filters: [view_01453.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01453.created_at_date: "7 days"]
    unless: [view_01453.id, view_01453.status]
  }

  join: view_01455 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01453.user_id} = ${view_01455.id} ;;
    required_joins: []
  }

  join: view_01456 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01453.account_id} = ${view_01456.account_id} ;;
    required_joins: [view_01455]
  }

  join: view_01457 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01453.category} = ${view_01457.category} ;;
  }

  access_filter: {
    field: view_01453.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01453.is_deleted} = false ;;
}
