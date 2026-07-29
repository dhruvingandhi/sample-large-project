# Explore: explore_1502
# Auto-generated LookML Explore File

include: "/views/domain_07/view_04507.view.lkml"
include: "/views/domain_09/view_04509.view.lkml"
include: "/views/domain_10/view_04510.view.lkml"
include: "/views/domain_11/view_04511.view.lkml"

explore: explore_1502 {
  label: "Explore Explore 1502"
  description: "Comprehensive analytics explore joining base view_04507 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04507
  
  always_filter: {
    filters: [view_04507.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04507.created_at_date: "7 days"]
    unless: [view_04507.id, view_04507.status]
  }

  join: view_04509 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04507.user_id} = ${view_04509.id} ;;
    required_joins: []
  }

  join: view_04510 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04507.account_id} = ${view_04510.account_id} ;;
    required_joins: [view_04509]
  }

  join: view_04511 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04507.category} = ${view_04511.category} ;;
  }

  access_filter: {
    field: view_04507.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04507.is_deleted} = false ;;
}
