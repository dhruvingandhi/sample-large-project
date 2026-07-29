# Explore: explore_1497
# Auto-generated LookML Explore File

include: "/views/domain_42/view_04492.view.lkml"
include: "/views/domain_44/view_04494.view.lkml"
include: "/views/domain_45/view_04495.view.lkml"
include: "/views/domain_46/view_04496.view.lkml"

explore: explore_1497 {
  label: "Explore Explore 1497"
  description: "Comprehensive analytics explore joining base view_04492 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04492
  
  always_filter: {
    filters: [view_04492.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04492.created_at_date: "7 days"]
    unless: [view_04492.id, view_04492.status]
  }

  join: view_04494 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04492.user_id} = ${view_04494.id} ;;
    required_joins: []
  }

  join: view_04495 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04492.account_id} = ${view_04495.account_id} ;;
    required_joins: [view_04494]
  }

  join: view_04496 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04492.category} = ${view_04496.category} ;;
  }

  access_filter: {
    field: view_04492.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04492.is_deleted} = false ;;
}
