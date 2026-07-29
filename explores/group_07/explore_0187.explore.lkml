# Explore: explore_0187
# Auto-generated LookML Explore File

include: "/views/domain_12/view_00562.view.lkml"
include: "/views/domain_14/view_00564.view.lkml"
include: "/views/domain_15/view_00565.view.lkml"
include: "/views/domain_16/view_00566.view.lkml"

explore: explore_0187 {
  label: "Explore Explore 0187"
  description: "Comprehensive analytics explore joining base view_00562 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00562
  
  always_filter: {
    filters: [view_00562.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00562.created_at_date: "7 days"]
    unless: [view_00562.id, view_00562.status]
  }

  join: view_00564 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00562.user_id} = ${view_00564.id} ;;
    required_joins: []
  }

  join: view_00565 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00562.account_id} = ${view_00565.account_id} ;;
    required_joins: [view_00564]
  }

  join: view_00566 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00562.category} = ${view_00566.category} ;;
  }

  access_filter: {
    field: view_00562.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00562.is_deleted} = false ;;
}
