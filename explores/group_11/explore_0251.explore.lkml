# Explore: explore_0251
# Auto-generated LookML Explore File

include: "/views/domain_04/view_00754.view.lkml"
include: "/views/domain_06/view_00756.view.lkml"
include: "/views/domain_07/view_00757.view.lkml"
include: "/views/domain_08/view_00758.view.lkml"

explore: explore_0251 {
  label: "Explore Explore 0251"
  description: "Comprehensive analytics explore joining base view_00754 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00754
  
  always_filter: {
    filters: [view_00754.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00754.created_at_date: "7 days"]
    unless: [view_00754.id, view_00754.status]
  }

  join: view_00756 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00754.user_id} = ${view_00756.id} ;;
    required_joins: []
  }

  join: view_00757 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00754.account_id} = ${view_00757.account_id} ;;
    required_joins: [view_00756]
  }

  join: view_00758 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00754.category} = ${view_00758.category} ;;
  }

  access_filter: {
    field: view_00754.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00754.is_deleted} = false ;;
}
