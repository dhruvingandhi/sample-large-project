# Explore: explore_0533
# Auto-generated LookML Explore File

include: "/views/domain_50/view_01600.view.lkml"
include: "/views/domain_02/view_01602.view.lkml"
include: "/views/domain_03/view_01603.view.lkml"
include: "/views/domain_04/view_01604.view.lkml"

explore: explore_0533 {
  label: "Explore Explore 0533"
  description: "Comprehensive analytics explore joining base view_01600 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01600
  
  always_filter: {
    filters: [view_01600.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01600.created_at_date: "7 days"]
    unless: [view_01600.id, view_01600.status]
  }

  join: view_01602 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01600.user_id} = ${view_01602.id} ;;
    required_joins: []
  }

  join: view_01603 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01600.account_id} = ${view_01603.account_id} ;;
    required_joins: [view_01602]
  }

  join: view_01604 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01600.category} = ${view_01604.category} ;;
  }

  access_filter: {
    field: view_01600.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01600.is_deleted} = false ;;
}
