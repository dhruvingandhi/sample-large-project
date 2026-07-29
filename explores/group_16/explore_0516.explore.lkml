# Explore: explore_0516
# Auto-generated LookML Explore File

include: "/views/domain_49/view_01549.view.lkml"
include: "/views/domain_01/view_01551.view.lkml"
include: "/views/domain_02/view_01552.view.lkml"
include: "/views/domain_03/view_01553.view.lkml"

explore: explore_0516 {
  label: "Explore Explore 0516"
  description: "Comprehensive analytics explore joining base view_01549 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01549
  
  always_filter: {
    filters: [view_01549.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01549.created_at_date: "7 days"]
    unless: [view_01549.id, view_01549.status]
  }

  join: view_01551 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01549.user_id} = ${view_01551.id} ;;
    required_joins: []
  }

  join: view_01552 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01549.account_id} = ${view_01552.account_id} ;;
    required_joins: [view_01551]
  }

  join: view_01553 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01549.category} = ${view_01553.category} ;;
  }

  access_filter: {
    field: view_01549.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01549.is_deleted} = false ;;
}
