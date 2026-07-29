# Explore: explore_0271
# Auto-generated LookML Explore File

include: "/views/domain_14/view_00814.view.lkml"
include: "/views/domain_16/view_00816.view.lkml"
include: "/views/domain_17/view_00817.view.lkml"
include: "/views/domain_18/view_00818.view.lkml"

explore: explore_0271 {
  label: "Explore Explore 0271"
  description: "Comprehensive analytics explore joining base view_00814 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00814
  
  always_filter: {
    filters: [view_00814.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00814.created_at_date: "7 days"]
    unless: [view_00814.id, view_00814.status]
  }

  join: view_00816 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00814.user_id} = ${view_00816.id} ;;
    required_joins: []
  }

  join: view_00817 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00814.account_id} = ${view_00817.account_id} ;;
    required_joins: [view_00816]
  }

  join: view_00818 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00814.category} = ${view_00818.category} ;;
  }

  access_filter: {
    field: view_00814.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00814.is_deleted} = false ;;
}
