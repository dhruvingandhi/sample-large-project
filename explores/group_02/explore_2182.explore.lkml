# Explore: explore_2182
# Auto-generated LookML Explore File

include: "/views/domain_47/view_06547.view.lkml"
include: "/views/domain_49/view_06549.view.lkml"
include: "/views/domain_50/view_06550.view.lkml"
include: "/views/domain_01/view_06551.view.lkml"

explore: explore_2182 {
  label: "Explore Explore 2182"
  description: "Comprehensive analytics explore joining base view_06547 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06547
  
  always_filter: {
    filters: [view_06547.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06547.created_at_date: "7 days"]
    unless: [view_06547.id, view_06547.status]
  }

  join: view_06549 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06547.user_id} = ${view_06549.id} ;;
    required_joins: []
  }

  join: view_06550 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06547.account_id} = ${view_06550.account_id} ;;
    required_joins: [view_06549]
  }

  join: view_06551 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06547.category} = ${view_06551.category} ;;
  }

  access_filter: {
    field: view_06547.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06547.is_deleted} = false ;;
}
