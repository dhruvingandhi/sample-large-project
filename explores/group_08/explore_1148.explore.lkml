# Explore: explore_1148
# Auto-generated LookML Explore File

include: "/views/domain_45/view_03445.view.lkml"
include: "/views/domain_47/view_03447.view.lkml"
include: "/views/domain_48/view_03448.view.lkml"
include: "/views/domain_49/view_03449.view.lkml"

explore: explore_1148 {
  label: "Explore Explore 1148"
  description: "Comprehensive analytics explore joining base view_03445 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03445
  
  always_filter: {
    filters: [view_03445.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03445.created_at_date: "7 days"]
    unless: [view_03445.id, view_03445.status]
  }

  join: view_03447 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03445.user_id} = ${view_03447.id} ;;
    required_joins: []
  }

  join: view_03448 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03445.account_id} = ${view_03448.account_id} ;;
    required_joins: [view_03447]
  }

  join: view_03449 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03445.category} = ${view_03449.category} ;;
  }

  access_filter: {
    field: view_03445.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03445.is_deleted} = false ;;
}
